//
//  RecipeListViewModel.swift
//  Yummly
//
//  Created by Tristan Newman on 11/11/24.
//

import SwiftUI
import Combine

@MainActor
protocol RecipeListViewModelProtocol {
    var recipeListService: RecipesServiceProtocol { get }
    var recipes: [Recipe] { get set }
    
    func onAppear() async throws
    func pullToRefresh() async
}

@MainActor
class RecipeListViewModel: ObservableObject, RecipeListViewModelProtocol {
    
    let recipeListService: RecipesServiceProtocol
    @Published var recipes: [Recipe] = []
    @Published var recipeNames: [String] = []
    @Published var cuisines: [String] = []
    @Published var recipeImageUrls: [URL] = []
    @Published var isLoading = false
    @Published var errorMessage: String? = nil
    private var cancellables: Set<AnyCancellable> = []
    @State var isConnected = false
    
    init(recipeService: RecipesServiceProtocol = RecipesService()) {
        recipeListService = recipeService
    }
    
    func onAppear() async throws {
        
        isLoading = true
        defer {isLoading = false}
        
        do {
            recipes = try await recipeListService.getRecipes()
            await loadRecipes()
        } catch {
            errorMessage = error.localizedDescription
        }
        
    }
    
    func pullToRefresh() async {
        do {
            try await onAppear()
        } catch {
            errorMessage = "Error refreshing recipes: \(error.localizedDescription)"
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
