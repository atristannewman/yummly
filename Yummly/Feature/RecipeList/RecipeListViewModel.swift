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
    private var recipes: [String] = []
    @Published var recipeNames: [String] = []
    
    
    func onAppear() async throws {
        recipes = try [await recipeListService.getRecipes()]
        loadRecipeNames()
    }
    
    private func loadRecipeNames() -> Void {
        recipeNames = recipes.map(\.self)
    }
}
