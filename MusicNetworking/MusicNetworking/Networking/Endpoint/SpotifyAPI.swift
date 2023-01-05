//
//  Spotify.swift
//  MusicNetworking
//
//  Created by Angel Zambrano on 1/4/23.
//

import Foundation


public enum SpotifyAPI {
    case gettingAccessToken
}

extension SpotifyAPI: EndPointType {
 
    
    var environmentBaseURL : String {
        switch NetworkManager.environment {
        case .production: return "https://accounts.spotify.com/api/"
        case .qa: return "none"
        case .staging: return "none"
        }
    }
    
    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.")}
        return url
    }
    
    
    var path: String {
        switch self {
        case .gettingAccessToken:
            return "token"
        }
    }
    
    var httpMethod: HTTPMethod {
        return .post
    }
    
    var task: HTTPTask {
        return .requestParametersAndHeaders(bodyParameters: nil, bodyEncoding: .urlEncoding, urlParameters: ["grant_type":"client_credentials"], additionHeaders: headers)
    }
    
    var headers: HTTPHeaders? {
        switch self {
        case .gettingAccessToken:
            return ["authorization":"Basic NGVhOWFkZjY3ZDgzNDg4NDhmZDUyYzUzZWE2YTY2MDI6MjVhM2I5NTkyNTM1NGY0N2JmNzgyNjhkZTNiYjhhZDU=", "Content-Type" : "application/x-www-form-urlencoded"]
        default:
            return nil
        }
    }
    
    
    
    
}

