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
            NavigationView {
                LoadGamesView()
            }.tabItem {
                Label("Load", systemImage: "arrowshape.down.circle.fill")
            }
            NavigationView {
                GamesListView()
            }.tabItem {
                Label("Games", systemImage: "formfitting.gamecontroller.fill")
            }
        }
        
    }
}

#Preview {
    ContentView()
}
