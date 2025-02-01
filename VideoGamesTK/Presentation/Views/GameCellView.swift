//
//  GameCellView.swift
//  VideoGamesTK
//
//  Created by Jose Miguel Serrato Moreno on 31/01/25.
//

import SwiftUI

struct GameCellView: View {
    let game: Game
    var toogleFavoriteButton: (() -> Void)?
    
    var body: some View {
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
                    Label("\(game.rate)", systemImage: "star.fill").font(.headline).foregroundStyle(Color.accentColor)
                }.frame(maxWidth: .infinity).padding(.trailing, 16)
            }
            Image(systemName: game.isFavorite ? "heart.fill" : "heart").foregroundStyle(.red).onTapGesture {
                toogleFavoriteButton?()
            }
        }.listRowSeparator(.hidden).frame(maxWidth: .infinity).padding().listRowBackground(Color.clear).background(ColorManager.customYellow).clipShape(RoundedCorner(radius: 8))
    }
}

