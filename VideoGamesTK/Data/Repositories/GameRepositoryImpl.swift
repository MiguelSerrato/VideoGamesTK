//
//  GameRepositoryImpl.swift
//  VideoGamesTK
//
//  Created by Jose Miguel Serrato Moreno on 29/01/25.
//
import Foundation
import CoreData

final class GameRepositoryImpl: GameRepository {
    
    private var games: [Game] = []
    private let apiClient: APIClient
    private var storeContainer: NSPersistentContainer
    
    init(apiClient: APIClient = APIClient(), storeContainer: NSPersistentContainer = PersistanceManager.shared.container) {
        self.apiClient = apiClient
        self.storeContainer = storeContainer
        retrieveGames()
    }
    
    func fetchGames() async throws -> [Game] {
        let response: [GameDTO] = try await apiClient.request(endpoint: .games)
        for gameDTO in response {
            if let index = getGameIndex(gameDTO.id) {
                gameDTO.toEntity(entity: games[index])
            } else {
                let newGame = Game(context: storeContainer.viewContext)
                gameDTO.toEntity(entity: newGame)
            }
        }
        saveData()
        return getGames()
    }
    
    
    private func getGameIndex(_ game: Game) -> Int? {
        guard let index = games.firstIndex(where: { $0.id == game.id }) else { return nil }
        return index
    }
    
    private func getGameIndex(_ id: Int) -> Int? {
        guard let index = games.firstIndex(where: { $0.id == id }) else { return nil }
        return index
    }
    
    func getGames() -> [Game] {
        retrieveGames()
        return games
    }
    
    func updateGame(_ game: Game, comments: String?, rating: Int?, isFavorite: Bool) {
        guard let index = getGameIndex(game) else { return }
        games[index].comments = comments
        games[index].rate = Int32(rating ?? 0)
        games[index].isFavorite = isFavorite
        saveData()
        retrieveGames()
    }
    
    func deleteGame(_ game: Game) {
        guard let index = getGameIndex(game) else { return }
        games[index].logicDeleted = true
        saveData()
        retrieveGames()
    }
    
    private func retrieveGames() {
        do {
            let request: NSFetchRequest<Game> = Game.fetchRequest()
            let sortDescriptor = NSSortDescriptor(key: "releaseDate", ascending: false)
            request.sortDescriptors = [sortDescriptor]
            request.returnsObjectsAsFaults = false
            request.predicate = NSPredicate(format: "logicDeleted = %@", false)
            games = try storeContainer.viewContext.fetch(request)
        } catch {
            print("Error al recuperar todos:")
        }
    }
    
    private func saveData() {
        do {
            try storeContainer.viewContext.save()
        } catch {
            print("Error guardando datos\(error)")
        }
    }
}
