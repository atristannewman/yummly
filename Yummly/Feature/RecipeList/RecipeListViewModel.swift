//
//  RecipeListViewModel.swift
//  Yummly
//
//  Created by Tristan Newman on 11/11/24.
//

import SwiftUI

@MainActor
class RecipeListViewModel: ObservableObject {
    
    private let recipeListService = RecipesService()
    private var recipes: [Recipe] = []
    @Published var recipeNames: [String] = []
    @Published var culinaryStyles: [String] = []
    @Published var recipeImageUrls: [URL] = []
    
    
    func onAppear() async throws {
        recipes = try await recipeListService.getRecipes()
        await loadRecipes()
    }
    
    private func loadRecipes() async -> Void {
        recipes.forEach { recipe in
            recipeNames.append(recipe.name)
            culinaryStyles.append(recipe.cuisine)
            if let urlString = recipe.photoURLLarge, let url = URL(string: urlString) {
                recipeImageUrls.append(url)
            }
        }
    }
}
