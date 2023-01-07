//
//  Spotify.swift
//  MusicNetworking
//
//  Created by Angel Zambrano on 1/4/23.
//

import Foundation

// this deals with token related issues in terms of spotify 
struct Spot: Codable {
    var access_token, token_type: String?
    var expires_in: Int?
}

struct Spot_Artists_Results: Codable {
    var artists: [Spot_Artist]
}

struct Spot_Artist: Codable {
   var id: String?
   var images: [Image]?
   var name: String?
   var popularity: Int?
    let genres: [String]?
    
}

struct Image: Codable {
    var height: Int?
    var url: String?
    var width: Int?
}
