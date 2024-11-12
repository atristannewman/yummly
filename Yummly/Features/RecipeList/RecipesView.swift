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
            if !viewModel.isConnected {
                Text("currently_offline")
                    .foregroundColor(.orange)
                    .padding()
            }
            
            if viewModel.isLoading {
                VStack {
                    ProgressView("recipes_loading")
                        .font(.system(size: 24))
                }
                .frame(maxWidth: .infinity, maxHeight: .init())
                
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
                            recipeCuisineType: viewModel.culinaryStyles[index]
                        )
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    RecipesView(viewModel: RecipeListViewModel())
}
