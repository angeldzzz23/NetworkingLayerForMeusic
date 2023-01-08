//
//  YoutubeAPI .swift
//  MusicNetworking
//
//  Created by Angel Zambrano on 1/6/23.
//

import Foundation

public enum YoutubeAPI {
    case getYoutubeVideo(id: String)
    case getVimeoVideo(id: String)
}


extension YoutubeAPI: EndPointType {
    var str: String {
        return "snippet%2CcontentDetails%2Cstatistics".removingPercentEncoding!
    }
    
    var environmentBaseURL : String {
        switch MeusicNetworkManager.environment {
        case .production: return "https://youtube.googleapis.com/youtube/v3/videos"
        case .qa: return "none"
        case .staging: return "none"
        }
    }
    
    
    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.")}
        return url
    }
    
    
    var path: String {
        return ""
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var task: HTTPTask {
        return .requestParametersAndHeaders(bodyParameters: nil, bodyEncoding: .urlAndJsonEncoding, urlParameters: ["part":"snippet%2CcontentDetails%2Cstatistics", "id":"Rwsqb4B1lKY", "key":"AIzaSyD8XaWOllqXg8yHDKE6ZKVAaUMZCNYYiKU"], additionHeaders: headers)
    }
    
    var headers: HTTPHeaders? {
        return ["application/json": "Accept"]
    }
    
    
    
}
