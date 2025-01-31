//
//  GetGamesUseCaseProtocol.swift
//  VideoGamesTK
//
//  Created by Jose Miguel Serrato Moreno on 30/01/25.
//

import Foundation

protocol GetGamesUseCaseProtocol {
    func execute() async throws -> [Game]
}

final class GetGamesUseCase: GetGamesUseCaseProtocol {
    
    private let repository: GameRepository
    
    init(repository: GameRepository = GameRepositoryImpl()) {
        self.repository = repository
    }
    
    func execute() async throws -> [Game] {
        try await repository.fetchGames()
    }
}
