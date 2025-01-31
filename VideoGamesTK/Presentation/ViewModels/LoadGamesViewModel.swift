//
//  GamesViewModel.swift
//  VideoGamesTK
//
//  Created by Jose Miguel Serrato Moreno on 30/01/25.
//
import Foundation
import SwiftUI
import Combine

final class LoadGamesViewModel: ObservableObject {
    @Published var games: [Game] = []
    
    @Published var loading: Bool = false
    var cancellables = Set<AnyCancellable>()
    
    private let getGamesUseCase: GetGamesUseCaseProtocol
    
    init(getGamesUseCase: GetGamesUseCaseProtocol = GetGamesUseCase()) {
        self.getGamesUseCase = getGamesUseCase
        loadGames()
    }
    
    func loadGames() {
        Task { @MainActor in
            do {
                loading = true
                let games = try await getGamesUseCase.execute()
                    self.games = games
                    self.loading = false
            } catch {
                print(error)
                self.loading = false
            }
        }
    }
    
}
