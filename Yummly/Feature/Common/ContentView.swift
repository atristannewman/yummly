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
<<<<<<<< Updated upstream:Yummly/Feature/Common/ContentView.swift
<<<<<<< Updated upstream
            RecipesView(viewModel: viewModel)
                .navigationTitle("Recipes")
========
            RecipesView(viewModel: viewModel) // Use RecipesView here
                .navigationTitle(String(localized: "recipes_title"))
=======
            VStack { // When another Feature/Screen is added this will likely change into a TabView
                Label("Hello world!", systemImage: "star")
            }
========
            RecipesView(viewModel: viewModel) // Use RecipesView here
                .navigationTitle(String(localized: "recipes_title"))
>>>>>>>> Stashed changes:Yummly/Features/Common/ContentView.swift
>>>>>>> Stashed changes
            
>>>>>>>> Stashed changes:Yummly/Features/Common/ContentView.swift
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
