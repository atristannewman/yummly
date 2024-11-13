//
//  RecipesService.swift
//  Yummly
//
//  Created by Tristan Newman on 11/11/24.
//

import Alamofire
import Foundation

protocol RecipesServiceProtocol {
    func getRecipes() async throws -> [Recipe]
}

actor RecipesService: RecipesServiceProtocol {
    func getRecipes() async throws -> [Recipe] {
        let url = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json"
        
        let response = try await AF.request(url).serializingDecodable(RecipeResponse.self).value
        
        if response.recipes.contains(where: { $0.name.isEmpty || $0.cuisine.isEmpty }) {
            throw NSError(domain: "DataError", code: -1, userInfo: [NSLocalizedDescriptionKey: "Malformed data received."])
        }
        
        return response.recipes
    }
}
