//
//  RecipesView.swift
//  Yummly
//
//  Created by Tristan Newman on 11/11/24.
//

import SwiftUI
import Kingfisher

struct RecipesView: View {
    @ObservedObject var viewModel: RecipeListViewModel
    
    var body: some View {
        ScrollView {
            if viewModel.isLoading {
                VStack {
                    ProgressView("recipes_loading")
                        .font(.system(size: 24))
                }
                .frame(maxWidth: .infinity, maxHeight: .init())
                
            } else if let errorMessage = viewModel.errorMessage {
                Text(String(errorMessage))
                    .foregroundColor(.red)
                    .padding()
            } else if viewModel.recipeNames.isEmpty {
                VStack {
                    Image(systemName: "frying.pan")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .foregroundColor(.gray)
                        .clipped()
                    VStack {
                        Text("no_recipes")
                            .font(.headline)
                            .foregroundColor(.gray)
                    }
                    
                }
                .padding()
            } else {
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 5), count: 2), spacing: 5) {
                    ForEach(Array(viewModel.recipeNames.enumerated()), id: \.offset) { index, name in
                        RecipeCell(
                            recipeName: name,
                            recipeUrl: viewModel.recipeImageUrls[index],
                            recipeCuisine: viewModel.cuisines[index]
                        )
                    }
                }
                .padding()
            } 
        }
        .onAppear() {
            Task {
                try await viewModel.onAppear()
            }
        }
        .refreshable {
           await viewModel.pullToRefresh()
        }
    }
}

#Preview {
    RecipesView(viewModel: RecipeListViewModel())
}
