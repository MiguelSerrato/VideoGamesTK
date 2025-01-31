//
//  Game.swift
//  VideoGamesTK
//
//  Created by Jose Miguel Serrato Moreno on 29/01/25.
//

import Foundation
import CoreData

public struct GameResponse: Codable {
    let results: [GameDTO]
}

public struct GameDTO:Codable {
    let id: Int
    let title: String
    let thumbnail: String
    let short_description: String
    let game_url: String
    let genre: String
    let platform: String
    let publisher: String
    let developer: String
    let release_date: String
    let freetogame_profile_url: String
}

extension GameDTO {
    func toEntity(entity: Game) {
        entity.id = Int32(id)
        entity.title = title
        entity.thumbnail = thumbnail
        entity.short_Description = short_description
        entity.gameURL = game_url
        entity.genre = genre
        entity.platform = platform
        entity.publisher = publisher
        entity.developer = developer
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        entity.releaseDate = dateFormatter.date(from: release_date)
        entity.freeToGameProfileURL = freetogame_profile_url
    }
}
