//
//  GameRepository.swift
//  VideoGamesTK
//
//  Created by Jose Miguel Serrato Moreno on 29/01/25.
//

public protocol GameRepository {
    func fetchGames() async throws -> [Game]
    func getGames() -> [Game]
    func updateGame(_ game: Game, comments: String?, rating: Int?, isFavorite: Bool)
    func deleteGame(_ game: Game)
}
