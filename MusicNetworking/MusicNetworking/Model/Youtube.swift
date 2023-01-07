//
//  Youtube.swift
//  MusicNetworking
//
//  Created by Angel Zambrano on 1/6/23.
//

import Foundation


// these are the various models to perform
struct Video: Codable {
    let kind, etag: String
    let items: [Item]
    let pageInfo: PageInfo
}


// MARK: - PageInfo
struct PageInfo: Codable {
    let totalResults, resultsPerPage: Int
}


// MARK: - Item
struct Item: Codable {
    let kind, etag, id: String
    let snippet: Snippet?
   

}

// MARK: - Snippet
struct Snippet: Codable {
    let publishedAt: String?
    let channelID: String?
    let title: String?
    let snippetDescription: String?
    let thumbnails: Thumbnails
    let channelTitle: String?

    enum CodingKeys: String, CodingKey {
        case publishedAt
        case channelID = "channelId"
        case title
        case snippetDescription = "description"
        case thumbnails
        case channelTitle

    }
}

// MARK: - Thumbnails
struct Thumbnails: Codable {
    let thumbnailsDefault, medium, high: Default

    enum CodingKeys: String, CodingKey {
        case thumbnailsDefault = "default"
        case medium, high
    }
}

// MARK: - Default
struct Default: Codable {
    let url: String
    let width, height: Int
}


