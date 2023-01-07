//
//  Spotify.swift
//  MusicNetworking
//
//  Created by Angel Zambrano on 1/4/23.
//

import Foundation


public enum SpotifyAPI {
    case gettingAccessToken
    case gettingArtists(artists: String)
    case gettingRelatedArtists(artist: String) // takes in the id of the artist
}


extension SpotifyAPI: EndPointType {
     
    var environmentBaseURL : String {
        switch NetworkManager.environment {
        case .production: return "https://api.spotify.com"
        case .qa: return "none"
        case .staging: return "none"
        }
    }
    

    
    
    var baseURL: URL {
        if path == "/api/token" {
            guard let url = URL(string: "https://accounts.spotify.com") else { fatalError("baseURL could not be configured.")}
            return url
        }
        
        
        guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.")}
        return url
    }
    
    
    var path: String {
        switch self {
        case .gettingAccessToken:
            return "/api/token"
        case .gettingArtists(let artists):
            return "/v1/artists"
        case .gettingRelatedArtists(let artists):
            return "/v1/artists/\(artists)/related-artists"
        }
   
        
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .gettingAccessToken:
            return .post
        case .gettingArtists(_):
            return .get
        case .gettingRelatedArtists(_):
            return .get
        }
        
    }
    
    var task: HTTPTask {
        switch self {
        case .gettingAccessToken:
            return .requestParametersAndHeaders(bodyParameters: nil, bodyEncoding: .urlEncoding, urlParameters: ["grant_type":"client_credentials"], additionHeaders: headers)
        case .gettingArtists(let artists):
            return .requestParametersAndHeaders(bodyParameters: nil, bodyEncoding: .urlEncoding, urlParameters: ["ids": artists], additionHeaders: headers)
        case .gettingRelatedArtists(_):
            return .requestParametersAndHeaders(bodyParameters: nil, bodyEncoding: .urlEncoding, urlParameters: nil, additionHeaders: headers)
        }
        
    }
    
    var headers: HTTPHeaders? {
        switch self {
        case .gettingAccessToken:
            return ["authorization":"Basic \(SpotNetworkingManager.basicKey)", "Content-Type" : "application/x-www-form-urlencoded"]
        case .gettingArtists(_):
            return ["authorization": "Bearer \(SpotNetworkingManager.accessToken)"]
        case .gettingRelatedArtists(_):
            return ["authorization": "Bearer \(SpotNetworkingManager.accessToken)"]
        }
    }
    
}

