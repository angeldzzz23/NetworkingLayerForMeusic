//
//  Spotify.swift
//  MusicNetworking
//
//  Created by Angel Zambrano on 1/4/23.
//

import Foundation

struct Spot: Codable {
    var access_token, token_type: String?
    var expires_in: Int?
}

