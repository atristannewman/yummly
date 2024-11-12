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

#Preview {
    RecipesView(viewModel: RecipeListViewModel())
}
