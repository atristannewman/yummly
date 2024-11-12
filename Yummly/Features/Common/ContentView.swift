//
//  ContentView.swift
//  Yummly
//
//  Created by Tristan Newman on 11/11/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = RecipeListViewModel()
    
    var body: some View {
        NavigationView {
            RecipesView(viewModel: viewModel) // Use RecipesView here
                .navigationTitle(String(localized: "recipes_title"))
        }.onAppear() {
            Task {
                try await viewModel.onAppear()
            }
            
        }
    }
}

#Preview {
    ContentView()
}
