//
//  VimeoAPI.swift
//  MusicNetworking
//
//  Created by Angel Zambrano on 1/7/23.
//

import Foundation

public enum VimeoAPI {
    case getVimeoVideo(id: String)
}


extension VimeoAPI: EndPointType {
    
    
    var baseURL: URL {
        guard let url = URL(string: "https://api.vimeo.com/videos/") else { fatalError("baseURL could not be configured.")}
        return url
    }
    
    var path: String {
        return "524933864"
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var task: HTTPTask {
        return .requestParametersAndHeaders(bodyParameters: nil, bodyEncoding: .urlEncoding, urlParameters: nil, additionHeaders: headers)
    }
    
    var headers: HTTPHeaders? {
        return ["Content-Type": "application/json", "Accept": "application/json", "Authorization": "Bearer \(VimeoNetworkingManager.token)"]
    }
    
    
}



