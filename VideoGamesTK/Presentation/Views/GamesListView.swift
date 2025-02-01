//
//  GameListView.swift
//  VideoGamesTK
//
//  Created by Jose Miguel Serrato Moreno on 30/01/25.
//

import SwiftUI

struct GamesListView: View {
    
    @EnvironmentObject var viewModel: GamesViewModel
    @State private var query = ""
    @State var showDetail: Bool = false
    @State var selectedGame: Game?
    
    var body: some View {
        NavigationStack {
            List(viewModel.filteredGames, id: \.self) { game in
                ZStack {
                    GameCellView(game: game).onTapGesture {
                        selectedGame = game
                        showDetail = true
                    }
                }.listRowSeparator(.hidden)
            }.id(UUID()).scrollContentBackground(.hidden).listStyle(.plain)
                .navigationTitle("Games")
                .navigationDestination(isPresented: $showDetail, destination: {
                    if let selectedGame {
                        GameDetailView(viewModel: GameDetailViewModel(gameSelected: selectedGame))
                    }
                })
                .searchable(text: $viewModel.searchText).searchSuggestions({
                    Section {
                        ForEach(viewModel.getSuggestions(), id: \.self) { suggestion in
                            Text(suggestion).searchCompletion(suggestion)
                        }
                    }
                })
                .myBackgrounImageStyle().onAppear {
                    showDetail = false
                    selectedGame = nil
                    viewModel.loadGamesCached()
                    
                    
                }
        }.scrollContentBackground(.hidden).listRowBackground(Color.red).listStyle(.plain).myBackgrounImageStyle().background {
            Image("backgroundImage")
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0)
                .edgesIgnoringSafeArea(.all)
        }
    }
}

#Preview {
    GamesListView().environmentObject(GamesViewModel())
}
