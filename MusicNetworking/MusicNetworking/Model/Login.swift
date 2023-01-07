//
//  Login.swift
//  MusicNetworking
//
//  Created by Angel Zambrano on 1/4/23.
//

import Foundation


struct Login: Codable {
    var success: Bool?
    var access: String?
    var refresh: String?
//    var id, email, username, token: String?
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
    let artists: [Artists]?
    let skills: [Skills]?
    var genres: [Genres]?
    let pictures, video: String?
    let vimeo_vids: [Venice_Vimeo]?
    let youtube_vids: [Venice_Youtube]?
    let nationalities: [Nationality]?
    
}

struct Genres: Codable {
    let genre_id: Int?
    let genre_name: String?
    
}

struct Skills: Codable {
    let skill_id: Int?
    let skill_name: String?
    
}

struct Artists:Codable {
    var user_artist_id: Int?
    var artist: String?
}

struct Venice_Youtube:Codable {
    var youtube_id: Int?
    // this is the id the we use for the request
    var video_id: String?
}

struct Venice_Vimeo: Codable {
    var vimeo_id: Int?
    // this is the id the we use for the request
    var video_id: String?
}

struct Nationality: Codable {
    var nationality_id: Int?
    // this is the id the we use for the request
    var nationality_name: String?
}

