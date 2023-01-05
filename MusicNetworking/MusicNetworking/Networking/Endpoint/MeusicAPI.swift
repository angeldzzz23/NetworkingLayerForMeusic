//
//  MeusicAPI.swift
//  MusicNetworking
//
//  Created by Angel Zambrano on 1/4/23.
//

import Foundation


// TODO:
// Implement the getting of a user
// implement the editing of a user
// implement confirming a user
public enum MeusicAPI {
    case login(email:String, password: String)
    case register(email: String, password: String)
    case getUserInfo
}

extension MeusicAPI: EndPointType {
    
    
    var environmentBaseURL : String {
        switch NetworkManager.environment {
        case .production: return "http://143.198.178.220:8000/"
        case .qa: return "No url"
        case .staging: return "no url"
        }
    }
    
    // this contains the base url for
    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.")}
        return url
    }
    
    var path: String {
        switch self {
        case .login(let email, let password):
            return "api/auth/login"
        case .register(let email, let password):
            return "api/auth/register"
        case .getUserInfo:
            return "api/auth/user"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .login(let email, let password):
            return .post
        case .register(let email, let password):
            return .post
        case .getUserInfo:
            return .get
        }
    }
    
    var task: HTTPTask {
        switch self {
        case .login(let email, let password):
            return .requestParameters(bodyParameters: ["email": email, "password": password], bodyEncoding: .jsonEncoding, urlParameters: nil)
        case .register(let email, let password):
            return .requestParameters(bodyParameters: ["email": email, "password": password], bodyEncoding: .jsonEncoding, urlParameters: nil)
        case .getUserInfo:
            print(headers)
            return .requestParametersAndHeaders(bodyParameters: nil, bodyEncoding: .jsonEncoding, urlParameters: nil, additionHeaders: headers)
        default:
            return .request
        }
        
    }
    
    var headers: HTTPHeaders? {
        switch self {
        case .getUserInfo:
            return ["Authorization" : "Bearer \(NetworkManager.MeusicToken)"]
        default:
            return nil
        }
        
    }
    
    
}
