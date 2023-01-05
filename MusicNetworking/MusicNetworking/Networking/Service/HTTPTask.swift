//
//  HTTPTask.swift
//  MusicNetworking
//
//  Created by Angel Zambrano on 1/4/23.
//

import Foundation

// typealias for a dictionary

public typealias HTTPHeaders = [String:String]


// it is reponsible or configuring parameters for a specific endpoint
public enum HTTPTask {
    case request
    
    case requestParameters(bodyParameters: Parameters?,
        bodyEncoding: ParameterEncoding,
        urlParameters: Parameters?)
    
    case requestParametersAndHeaders(bodyParameters: Parameters?,
        bodyEncoding: ParameterEncoding,
        urlParameters: Parameters?,
        additionHeaders: HTTPHeaders?)
    
    // case download, upload...etc
}
