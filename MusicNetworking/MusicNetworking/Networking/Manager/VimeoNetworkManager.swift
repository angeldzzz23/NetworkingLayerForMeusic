//
//  VimeoNetworkManager.swift
//  MusicNetworking
//
//  Created by Angel Zambrano on 1/7/23.
//

import Foundation


struct VimeoNetworkingManager {
    static let key = "AIzaSyD8XaWOllqXg8yHDKE6ZKVAaUMZCNYYiKU"
    
    static let token  = "8f1ed672031741802e74dd133a84cf02"
    
    
    let vimeoRouter = Router<VimeoAPI>()
    
    
    // this gives you the token
    // we shoudl
    func getvimeoVideo(id: String, completion: @escaping (_ video: VimeoItem?,_ error: String?)->()) {
        
        
        vimeoRouter.request(.getVimeoVideo(id: id)) { data, response, error in
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
                        let apiResponse = try JSONDecoder().decode(VimeoItem.self, from: responseData)
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
    
    func getYoutubeVid2(id: String, completion: @escaping (Video?) -> Void) {
        
        // setting up the url
        guard var url2 = URLComponents(string: "https://youtube.googleapis.com/youtube/v3/videos") else {return}

        // setting up the query items
        let queryItems = [
            URLQueryItem(name: "part", value: "snippet%2CcontentDetails%2Cstatistics".removingPercentEncoding),
            URLQueryItem(name: "id", value: id),
            URLQueryItem(name: "key", value: "AIzaSyD8XaWOllqXg8yHDKE6ZKVAaUMZCNYYiKU"),
        ]
        
        url2.queryItems = queryItems
        
        // setting up the request
        var request = URLRequest(url: url2.url!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        URLSession.shared.dataTask(with: request) { data, response, err in
            
            guard err == nil else {
                print("error: ", err!)
                return
            }
            
            guard  let response = response as? HTTPURLResponse else {
                    print("no response")
                return
            }
            
            guard response.statusCode == 200 else {
                print("BAD RESPONSE: ", response.statusCode)
                return
            }
            
            guard let data = data else {
                print("no data ")
                return
            }
            
          
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let artist = try decoder.decode(Video.self, from: data)
                completion(artist)
            }
            catch {
                print("catch: ", error)
            }
          
        }.resume()
    }
    
    
    
//    func getArtists(artists: [String], completion: @escaping (_ artists: Spot_Artists_Results?,_ error: String?)->()) {
//        //
//        spotifyRouter.request(.gettingArtists(artists: "790FomKkXshlbRYZFtlgla,0XwVARXT135rw8lyw1EeWP")) { data, response, error in
//
//            if let response = response as? HTTPURLResponse {
//                let result = self.handleNetworkResponse(response)
//                switch result {
//
//                case .success:
//                    guard let responseData = data else {
//                        completion(nil, NetworkResponse.noData.rawValue)
//                        return
//                    }
//
//                    do {
//                        print(responseData)
//                        let jsonData = try JSONSerialization.jsonObject(with: responseData, options: .mutableContainers)
//                        print(jsonData)
//                        let apiResponse = try JSONDecoder().decode(Spot_Artists_Results.self, from: responseData)
//                        completion(apiResponse,nil)
//                    }catch {
//                        print(error)
//                        completion(nil, NetworkResponse.unableToDecode.rawValue)
//                    }
//                case .failure(let networkFailureError):
//                    completion(nil, networkFailureError)
//                }
//            }
//
//
//        }
//    }
    
    
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
