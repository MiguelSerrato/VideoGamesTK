//
//  GameListView.swift
//  VideoGamesTK
//
//  Created by Jose Miguel Serrato Moreno on 30/01/25.
//

import SwiftUI

struct GameListView: View {
    
    @EnvironmentObject var viewModel: GamesViewModel
    @State private var query = ""
    
    var body: some View {
        List(viewModel.games) { game in
            ZStack(alignment: .topTrailing) {
                HStack(alignment: .top) {
                    AsyncImage(url: URL(string: game.thumbnail ?? "")) { result in
                        result.resizable().scaledToFill().frame(width: 80, height: 80, alignment: .center).clipped().contentShape(Rectangle()).clipShape(RoundedCorner(radius: 8))
                    } placeholder: {
                        ProgressView()
                    }.frame(width: 80, height: 80, alignment: .center)
                    VStack(alignment: .leading) {
                        Text(game.title ?? "")
                            .font(.title2).frame(maxWidth: .infinity,alignment: .leading).foregroundStyle(Color.accentColor).lineLimit(1)
                        
                        Text(game.genre ?? "").font(.headline)
                            .foregroundColor(.gray)
                        Label("0", systemImage: "star.fill").font(.headline).foregroundStyle(Color.accentColor)
                    }.frame(maxWidth: .infinity).padding(.trailing, 16)
                }
                Image(systemName: game.isFavorite ? "heart.fill" : "heart").foregroundStyle(.red).onTapGesture {
                    
                }
            }.listRowSeparator(.hidden).frame(maxWidth: .infinity).padding().listRowBackground(Color.clear).background(.white.opacity(0.8)).clipShape(RoundedCorner(radius: 8))
        }.scrollContentBackground(.hidden).listStyle(.plain)
            .navigationTitle("Games")
            .searchable(text: $query)
            .onChange(of: query) { newQuery in
                //Task { await viewModel.search(matching: query) }
            }.myBackgrounImageStyle().onAppear {
                viewModel.loadGamesCached()
            }
        
    }
}

#Preview {
    GameListView().environmentObject(GamesViewModel())
}
