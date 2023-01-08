//
//  SpotifyNetworkingModel.swift
//  MusicNetworking
//
//  Created by Angel Zambrano on 1/4/23.
//

import Foundation


struct SpotNetworkingManager {
    static let SpotifyKey = "7ef6917b87a13c2d4c6eb3cc5d12046e"
    static let basicKey = "NGVhOWFkZjY3ZDgzNDg4NDhmZDUyYzUzZWE2YTY2MDI6MjVhM2I5NTkyNTM1NGY0N2JmNzgyNjhkZTNiYjhhZDU="
    static var accessToken = "BQDLAoffWwKworWAJq24aEJpNHCHRxh9O6KdzGT7PNG0bdS5hF7iTM2hbYUHNRNcVbSOImlK4PdFQwS-MzgjlkkOY6zF2m-9STcIMu3ITQFwKL9uZMQ"
    let spotifyRouter = Router<SpotifyAPI>()
    
    
    // this gives you the token
    // we shoudl
    func getToken(completion: @escaping (_ re: Spot?,_ error: String?)->()) {
        spotifyRouter.request(.gettingAccessToken) { data, response, error in
            // TODO
            // TODO:
            if error != nil {
                completion(nil, "Please check your network connection.")
            }
            
            if let response = response as? HTTPURLResponse {
                let result = self.handleNetworkResponse(response)
                switch result {
                case .success:
                    guard let responseData = data else {
                        completion(nil, NetworkResponse.noData.rawValue)
                        return
                    }
                    
                    do {
                        print(responseData)
                        let jsonData = try JSONSerialization.jsonObject(with: responseData, options: .mutableContainers)
                        print(jsonData)
                        let apiResponse = try JSONDecoder().decode(Spot.self, from: responseData)
                        completion(apiResponse,nil)
                    }catch {
                        print(error)
                        completion(nil, NetworkResponse.unableToDecode.rawValue)
                    }
                case .failure(let networkFailureError):
                    completion(nil, networkFailureError)
                }
            }
            
           
            
        }
    }
    
    func getArtists(artists: [String], completion: @escaping (_ artists: Spot_Artists_Results?,_ error: String?)->()) {
        //
        spotifyRouter.request(.gettingArtists(artists: "790FomKkXshlbRYZFtlgla,0XwVARXT135rw8lyw1EeWP")) { data, response, error in
            
            if let response = response as? HTTPURLResponse {
                let result = self.handleNetworkResponse(response)
                switch result {
                    
                case .success:
                    guard let responseData = data else {
                        completion(nil, NetworkResponse.noData.rawValue)
                        return
                    }
                    
                    do {
                        print(responseData)
                        let jsonData = try JSONSerialization.jsonObject(with: responseData, options: .mutableContainers)
                        print(jsonData)
                        let apiResponse = try JSONDecoder().decode(Spot_Artists_Results.self, from: responseData)
                        completion(apiResponse,nil)
                    }catch {
                        print(error)
                        completion(nil, NetworkResponse.unableToDecode.rawValue)
                    }
                case .failure(let networkFailureError):
                    completion(nil, networkFailureError)
                }
            }
            
            
        }
    }
    
    // get related artists
    
    func getRelatedArtists(artist: String, completion: @escaping (_ artists: Spot_Artists_Results?,_ error: String?)->()) {
        
        spotifyRouter.request(.gettingRelatedArtists(artist: artist)) { data, response, error in
            if let response = response as? HTTPURLResponse {
                let result = self.handleNetworkResponse(response)
                switch result {
                    
                case .success:
                    guard let responseData = data else {
                        completion(nil, NetworkResponse.noData.rawValue)
                        return
                    }
                    
                    do {
                        print(responseData)
                        let jsonData = try JSONSerialization.jsonObject(with: responseData, options: .mutableContainers)
                        print(jsonData)
                        let apiResponse = try JSONDecoder().decode(Spot_Artists_Results.self, from: responseData)
                        completion(apiResponse,nil)
                    }catch {
                        print(error)
                        completion(nil, NetworkResponse.unableToDecode.rawValue)
                    }
                case .failure(let networkFailureError):
                    completion(nil, networkFailureError)
                }
            }
        }
        
    }
    
    
    fileprivate func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<String>{
        switch response.statusCode {
        case 200...299: return .success
        case 401...500: return .failure(NetworkResponse.authenticationError.rawValue)
        case 501...599: return .failure(NetworkResponse.badRequest.rawValue)
        case 600: return .failure(NetworkResponse.outdated.rawValue)
        default: return .failure(NetworkResponse.failed.rawValue)
        }
    }
    
}
