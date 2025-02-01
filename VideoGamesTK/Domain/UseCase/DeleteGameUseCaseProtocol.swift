//
//  DeleteGameUseCaseProtocol.swift
//  VideoGamesTK
//
//  Created by Jose Miguel Serrato Moreno on 31/01/25.
//

import Foundation

protocol DeleteGameUseCaseProtocol {
    func execute(_ game: Game)
}

final class DeleteGameUseCase: DeleteGameUseCaseProtocol {
    
    private let repository: GameRepository
    
    init(repository: GameRepository = GameRepositoryImpl()) {
        self.repository = repository
    }
    
    func execute(_ game: Game) {
        self.repository.deleteGame(game)
    }
    
}
