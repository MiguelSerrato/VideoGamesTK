//
//  GameDetailViewModel.swift
//  VideoGamesTK
//
//  Created by Jose Miguel Serrato Moreno on 31/01/25.
//

import Foundation
import SwiftUI
import Combine

final class GameDetailViewModel: ObservableObject {
    
    @Published var gameSelected: Game
    @Published var rate: Int
    @Published var isFavorite: Bool
    @Published var comments: String
    
    private let updateGameUseCase: UpdateGameUseCaseProtocol
    private let deleteGameUseCase: DeleteGameUseCaseProtocol
    
    init(gameSelected: Game, updateGameUseCase: UpdateGameUseCaseProtocol = UpdateGameUseCase(), deleteGameUseCase: DeleteGameUseCaseProtocol = DeleteGameUseCase()) {
        self.gameSelected = gameSelected
        self.updateGameUseCase = updateGameUseCase
        self.deleteGameUseCase = deleteGameUseCase
        self.rate = Int(gameSelected.rate)
        self.isFavorite = gameSelected.isFavorite
        self.comments = gameSelected.comments ?? ""
    }
    
    func update() {
        Task { @MainActor in
            updateGameUseCase.execute(gameSelected, comments: comments, rating: rate, isFavorite: isFavorite)
        }
    }
    
    func delete() {
        Task { @MainActor in
            deleteGameUseCase.execute(gameSelected)
        }
    }
    
}
