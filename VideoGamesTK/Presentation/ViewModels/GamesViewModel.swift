//
//  GamesViewModel.swift
//  VideoGamesTK
//
//  Created by Jose Miguel Serrato Moreno on 30/01/25.
//
import Foundation
import SwiftUI
import Combine

final class GamesViewModel: ObservableObject {
    @Published var games: [Game] = []
    
    @Published var loading: Bool = false
    var cancellables = Set<AnyCancellable>()
    @Published var searchText: String = ""
    
    private let getGamesUseCase: GetGamesUseCaseProtocol
    
    var filteredGames: [Game] {
        guard !searchText.isEmpty else {
            return games
        }
        return games.filter { game in
            (game.title ?? "").localizedCaseInsensitiveContains(searchText) || (game.genre ?? "").localizedCaseInsensitiveContains(searchText)
        }
    }
    
    init(getGamesUseCase: GetGamesUseCaseProtocol = GetGamesUseCase()) {
        self.getGamesUseCase = getGamesUseCase
    }
    
    func loadGamesCached() {
        Task { @MainActor in
            do {
                loading = true
                let games = try await getGamesUseCase.execute(onlyCache: true)
                self.games = games
                self.loading = false
            } catch {
                print(error)
                self.loading = false
            }
        }
    }
    
    func loadGames() {
        Task { @MainActor in
            do {
                loading = true
                let games = try await getGamesUseCase.execute(onlyCache: false)
                self.games = games
                self.loading = false
            } catch {
                print(error)
                self.games = try await getGamesUseCase.execute(onlyCache: true)
                self.loading = false
            }
        }
    }
    
    
    
    func getSuggestions() -> [String] {
        guard !searchText.isEmpty else {
            return []
        }
        var suggestions = games.map { ($0.title ?? "") }
        suggestions.append(contentsOf: games.map { ($0.genre ?? "") })
        suggestions = suggestions.filter { $0.localizedStandardContains(searchText) }
        return Array(Set(suggestions)).sorted()
        
    }
    
}
