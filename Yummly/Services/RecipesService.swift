//
//  RecipesService.swift
//  Yummly
//
//  Created by Tristan Newman on 11/11/24.
//

import Alamofire

actor RecipesService {
    func getRecipes() async throws -> [Recipe] {
        let url = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json"
        
        let response = try await AF.request(url).serializingDecodable(RecipeResponse.self).value
        
        return response.recipes
    }
}
