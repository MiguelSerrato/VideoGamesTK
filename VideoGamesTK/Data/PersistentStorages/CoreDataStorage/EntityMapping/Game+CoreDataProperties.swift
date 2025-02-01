//
//  Game+CoreDataProperties.swift
//  VideoGamesTK
//
//  Created by Jose Miguel Serrato Moreno on 30/01/25.
//
//

import Foundation
import CoreData


extension Game {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Game> {
        return NSFetchRequest<Game>(entityName: "Game")
    }
    
    @NSManaged public var id: Int32
    @NSManaged public var title: String?
    @NSManaged public var thumbnail: String?
    @NSManaged public var short_Description: String?
    @NSManaged public var gameURL: String?
    @NSManaged public var genre: String?
    @NSManaged public var platform: String?
    @NSManaged public var publisher: String?
    @NSManaged public var developer: String?
    @NSManaged public var freeToGameProfileURL: String?
    @NSManaged public var releaseDate: Date?
    @NSManaged public var rate: Int32
    @NSManaged public var isFavorite: Bool
    @NSManaged public var logicDeleted: Bool
    @NSManaged public var comments: String?
    
}

extension Game : Identifiable {
    
}
