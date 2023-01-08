//
//  Vimeo.swift
//  MusicNetworking
//
//  Created by Angel Zambrano on 1/7/23.
//

import Foundation


// MARK: - Welcome
struct VimeoItem: Codable {
    let uri, name, description, type: String?
    let link, playerEmbedURL: String?
    let contentRatingClass: String?
    let ratingModLocked: Bool?
    let privacy: Privacy?
    let pictures: Pictures?
    let status: String?
    let user: UserInfo?

    enum CodingKeys: String, CodingKey {
        case uri, name
        case description
        case type, link
        case playerEmbedURL = "player_embed_url"
        case contentRatingClass
        case ratingModLocked
        case privacy
        case pictures
        case status
        case user
    }
}

struct UserInfo: Codable {
    let uri: String
    let name: String
    let link: String
  
    enum CodingKeys: String, CodingKey {
        case uri
        case name
        case link
    }
    
}


// MARK: - Pictures
struct Pictures: Codable {
    let uri: String?
    let active: Bool?
    let type: String?
    let baseLink: String?
    let sizes: [Size]?
    let resourceKey: String?
    let defaultPicture: Bool?

    enum CodingKeys: String, CodingKey {
        case uri, active, type
        case baseLink
        case sizes
        case resourceKey
        case defaultPicture
    }
}

// MARK: - Size
struct Size: Codable {
    let width, height: Int?
    let link: String?
    let linkWithPlayButton: String?

    enum CodingKeys: String, CodingKey {
        case width, height, link
        case linkWithPlayButton
    }
}

// MARK: - Privacy
struct Privacy: Codable {
    let view, embed: String
    let download, add: Bool
    let comments: String
}

// MARK: - Uploader
struct Uploader: Codable {
    let pictures: Pictures
}
