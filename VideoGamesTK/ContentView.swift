//
//  ContentView.swift
//  VideoGamesTK
//
//  Created by Jose Miguel Serrato Moreno on 28/01/25.
//

import SwiftUI

struct ContentView: View {
    init() {
        UITabBar.appearance().backgroundColor = UIColor.lightGray
        UITabBar.appearance().unselectedItemTintColor = UIColor.gray
    }
    var body: some View {
        TabView {
            LoadGamesView().tabItem {
                Label("Reload", systemImage: "arrowshape.down.circle.fill")
            }
            GameListView().tabItem {
                Label("Games", systemImage: "formfitting.gamecontroller.fill")
            }
        }
        
    }
}

#Preview {
    ContentView()
}
