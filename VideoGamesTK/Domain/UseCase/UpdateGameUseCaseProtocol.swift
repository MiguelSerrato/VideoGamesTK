//
//  UpdateGameUseCaseProtocol.swift
//  VideoGamesTK
//
//  Created by Jose Miguel Serrato Moreno on 31/01/25.
//

import Foundation

protocol UpdateGameUseCaseProtocol {
    func execute(_ game: Game, comments: String?, rating: Int?, isFavorite: Bool)
}

final class UpdateGameUseCase: UpdateGameUseCaseProtocol {
    
    private let repository: GameRepository
    
    init(repository: GameRepository = GameRepositoryImpl()) {
        self.repository = repository
    }
    
    func execute(_ game: Game, comments: String?, rating: Int?, isFavorite: Bool) {
        self.repository.updateGame(game, comments: comments, rating: rating, isFavorite: isFavorite)
    }
    
}
