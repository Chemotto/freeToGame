//
//  Game.swift
//  freeToGame
//
//  Created by Tardes on 20/1/26.
//

import Foundation


struct game: Codable {
    let id: Int
    let title: String
    let thumbnail: String
    let shortDescription: String
    let gameUrl: String
    let genre: String
    let platform: String
    let publisher: String
    let developer: String
    let releaseDate: String
    let profileUrl: String
    let description: String?
    let systemRequirements: SystemRequirements?
    let screenshots: [Screenshots]?
    
    
    
    
    enum     CodingKeys: String, CodingKey {
        case shortDescription = "short_description"
        case gameUrl = "game_url"
        case releaseDate = "release_date"
        case profileUrl = "freetogame_profile_url"
        case systemRequirements = "minimum_system_requirements"
    
        
        case id, title, thumbnail,genre, platform, publisher, developer, description, screenshots
        

        
    }
}

struct SystemRequirements: Codable {
    let os: String
    let processor: String
    let memory: String
    let graphics: String
    let storage: String
}

struct Screenshots: Codable {
    let image: String
}




