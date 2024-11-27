//
//  ContentView.swift
//  Yummly
//
//  Created by Tristan Newman on 11/11/24.
//

import SwiftUI

@MainActor
struct ContentView: View {
    @StateObject private var recipeListViewModel = RecipeListViewModel()

    var body: some View {
        NavigationView {
            RecipesView(viewModel: recipeListViewModel)
                .navigationTitle(String(localized: "recipes_title"))
                .task {
                    try? await recipeListViewModel.start()
                }
        }
        .offlineAlert()
        .overlay {
            if recipeListViewModel.isLoading {
                ProgressView()
            }
        }
    }
}

#Preview {
    ContentView()
}
