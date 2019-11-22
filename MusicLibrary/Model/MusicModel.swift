//
//  MusicModel.swift
//  MusicLibrary
//
//  Created by Consultant on 11/18/19.
//  Copyright © 2019 Consultant. All rights reserved.
//

import Foundation

struct MusicResponse: Decodable {
    let musicfeed : MusicFeed
    
    enum CodingKeys: String,CodingKey {
        case musicfeed = "feed"
    }
}

struct MusicFeed: Decodable {
    let results : [Results]
    
    enum CodingKeys: String, CodingKey{
        case results = "results"
    }
}

struct Results: Decodable {
    let artistName : String?
    let albumName : String?
    let thumbnailImage : String?
    let url : String?
    let releaseDate : String?
    let copyRight: String?
    
    enum CodingKeys: String, CodingKey {
        case artistName = "artistName"
        case albumName = "name"
        case thumbnailImage = "artworkUrl100"
        case url = "url"
        case releaseDate = "releaseDate"
        case copyRight = "copyright"
    }
}













