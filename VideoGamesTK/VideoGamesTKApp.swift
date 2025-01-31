//
//  VideoGamesTKApp.swift
//  VideoGamesTK
//
//  Created by Jose Miguel Serrato Moreno on 28/01/25.
//

import SwiftUI

@main
struct VideoGamesTKApp: App {
    @StateObject private var viewModel: GamesViewModel = GamesViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(viewModel)
        }
    }
}
