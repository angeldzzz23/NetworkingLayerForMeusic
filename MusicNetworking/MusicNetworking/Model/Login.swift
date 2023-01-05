//
//  Login.swift
//  MusicNetworking
//
//  Created by Angel Zambrano on 1/4/23.
//

import Foundation


struct Login: Codable {
    var id, email, username, token: String?
}

struct Register: Codable {
    var success: Bool?
    var user: User
}

struct User: Codable {
    let username: String?
    let email: String?
    let first_name, last_name, gender_name, DOB: String?
    let about_me: String?
    let artists: [String]?
    let skills: [Skills]?
    var genres: [Genres]?
    let pictures, video: String?
    let youtub_vids, vimeo_vids: [String]?
    let youtube_vids: [String]?
    
}

struct Genres: Codable {
    let genre_id: Int?
    let genre_name: String?
    
}

struct Skills: Codable {
    // TODO:
    let skill_id: Int?
    let skill_name: String?
    
}



