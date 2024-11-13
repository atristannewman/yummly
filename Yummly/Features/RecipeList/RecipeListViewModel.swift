//
//  RecipeListViewModel.swift
//  Yummly
//
//  Created by Tristan Newman on 11/11/24.
//

import SwiftUI

@MainActor
protocol RecipeListViewModelProtocol {
    var recipeListService: RecipesServiceProtocol { get }
    var recipes: [Recipe] { get set }
    
    func onAppear() async throws
}

@MainActor
class RecipeListViewModel: ObservableObject, RecipeListViewModelProtocol {
    
    let recipeListService: RecipesServiceProtocol
    @ObservedObject var networkManager = NetworkManager()
    @Published var recipes: [Recipe] = []
    @Published var recipeNames: [String] = []
    @Published var cuisines: [String] = []
    @Published var recipeImageUrls: [URL] = []
    @Published var isLoading = false
    @Published var isConnected = false
    @Published var errorMessage: String? = nil
    
    init(recipeService: RecipesServiceProtocol = RecipesService()) {
        recipeListService = recipeService
    }
    
    func onAppear() async throws {
        
        isLoading = true
        defer {isLoading = false}
        
        isConnected = await networkManager.reachable()
        if !isConnected {
            errorMessage = "No internet connection. Please check your settings."
            return
        }
        
        do {
            recipes = try await recipeListService.getRecipes()
            await loadRecipes()
        } catch {
            errorMessage = error.localizedDescription
        }
        
    }
    
    private func loadRecipes() async -> Void {
        recipes.forEach { recipe in
            recipeNames.append(recipe.name)
            cuisines.append(recipe.cuisine)
            if let urlString = recipe.photoURLLarge, let url = URL(string: urlString) {
                recipeImageUrls.append(url)
            }
        }
    }
}
