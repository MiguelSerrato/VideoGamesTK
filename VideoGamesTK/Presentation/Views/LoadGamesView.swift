//
//  LoadGamesView.swift
//  VideoGamesTK
//
//  Created by Jose Miguel Serrato Moreno on 30/01/25.
//

import SwiftUI

struct LoadGamesView: View {
    @EnvironmentObject var viewModel: GamesViewModel
    @State var loading:Bool = false
    
    private var games: [Game] {
        viewModel.games.filter { !$0.logicDeleted }
    }
    
    var body: some View {
        
        ZStack {
            VStack {
                Text("\(games.count)").font(.system(size: 80)).bold().foregroundStyle(ColorManager.backgroundColor).animation(.easeInOut(duration:2.0))
                Text("Games Loaded").font(.headline).foregroundStyle(Color.black).animation(.easeInOut(duration:2.0))
            }.padding().background(Color(uiColor: UIColor.lightGray).opacity(0.5)).cornerRadius(8).onTapGesture {
                viewModel.loadGames()
            }
            ProgressView {
                Text("Loading").font(.largeTitle)
            }.frame(maxWidth: .infinity, maxHeight: .infinity).background(.black.opacity(0.5)).isHidden(!viewModel.loading)
        }.myBackgrounImageStyle().toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                HStack(spacing: 0) {
                    Button {
                        viewModel.loadGames()
                    } label: {
                        Image(systemName: "arrow.trianglehead.2.counterclockwise.rotate.90")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundStyle(.primary)
                    }
                }
            }
        }.onAppear {
            viewModel.loadGamesCached()
        }.alert("Error", isPresented: $viewModel.showError) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(viewModel.errorMessage)
        }
        
    }
}

#Preview {
    LoadGamesView().environmentObject(GamesViewModel())
}
