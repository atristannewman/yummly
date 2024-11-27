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
    
    func start() async throws
    func pullToRefresh() async
}

@MainActor
class RecipeListViewModel: ObservableObject, RecipeListViewModelProtocol {
    
    let recipeListService: RecipesServiceProtocol
    @Published var recipes: [Recipe] = []
    @Published var isLoading = false
    @Published var errorMessage: String? = nil
    private var cancellables: Set<AnyCancellable> = []
    @State var isConnected = false
    
    init(recipeService: RecipesServiceProtocol = RecipesService()) {
        recipeListService = recipeService
    }
    
    private func loadRecipes() async throws {
        isLoading = true
        defer { isLoading = false }
        
        recipes = try await recipeListService.getRecipes()
    }
    
    func start() async throws {
        try await loadRecipes()
    }
    
    func pullToRefresh() async {
        try? await loadRecipes()
    }
}
