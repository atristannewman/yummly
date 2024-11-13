//
//  MockRecipesService.swift
//  YummlyTests
//
//  Created by Tristan Newman on 11/12/24.
//

import XCTest
@testable import Yummly

class MockRecipesService: RecipesServiceProtocol {
    enum ResponseType {
        case normal
        case malformed
        case empty
    }
    
    var responseType: ResponseType = .normal
    
    func getRecipes() async throws -> [Recipe] {
        
        switch responseType {
            case .normal:
            return [Recipe(
                cuisine: "Malaysian",
                name: "Apple Frangipan Tart",
                photoURLLarge: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/large.jpg",
                photoURLSmall: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/small.jpg",
                id: "0c6ca6e7-e32a-4053-b824-1dbf749910d8",
                sourceURL: "https://www.nyonyacooking.com/recipes/apam-balik~SJ5WuvsDf9WQ",
                youtubeURL: "https://www.youtube.com/watch?v=6R8ffRRJcrg"
             )]
        case .malformed:
            return [
                Recipe(
                    cuisine: "Malaysian",
                    name: "",
                    photoURLLarge: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/large.jpg",
                    photoURLSmall: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/small.jpg",
                    id: "0c6ca6e7-e32a-4053-b824-1dbf749910d8",
                    sourceURL: "https://www.nyonyacooking.com/recipes/apam-balik~SJ5WuvsDf9WQ",
                    youtubeURL: "https://www.youtube.com/watch?v=6R8ffRRJcrg"
                ),
                Recipe(
                    cuisine: "",
                    name: "Apple Frangipan Tart",
                    photoURLLarge: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/large.jpg",
                    photoURLSmall: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/small.jpg",
                    id: "0c6ca6e7-e32a-4053-b824-1dbf749910d8",
                    sourceURL: "https://www.nyonyacooking.com/recipes/apam-balik~SJ5WuvsDf9WQ",
                    youtubeURL: "https://www.youtube.com/watch?v=6R8ffRRJcrg"
                ),
                Recipe(
                    cuisine: "Malaysian",
                    name: "Apple Frangipan Tart",
                    photoURLLarge: "",
                    photoURLSmall: "",
                    id: "0c6ca6e7-e32a-4053-b824-1dbf749910d8",
                    sourceURL: "https://www.nyonyacooking.com/recipes/apam-balik~SJ5WuvsDf9WQ",
                    youtubeURL: "https://www.youtube.com/watch?v=6R8ffRRJcrg"
                ),
                Recipe(
                    cuisine: "Malaysian",
                    name: "Apple Frangipan Tart",
                    photoURLLarge: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/large.jpg",
                    photoURLSmall: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/small.jpg",
                    id: "",
                    sourceURL: "https://www.nyonyacooking.com/recipes/apam-balik~SJ5WuvsDf9WQ",
                    youtubeURL: "https://www.youtube.com/watch?v=6R8ffRRJcrg"
                ),
                Recipe(
                    cuisine: "1234",
                    name: "Apple Frangipan Tart",
                    photoURLLarge: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/large.jpg",
                    photoURLSmall: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/small.jpg",
                    id: "aeiou",
                    sourceURL: "https://www.nyonyacooking.com/recipes/apam-balik~SJ5WuvsDf9WQ",
                    youtubeURL: "notAUrl"
                )]
        case .empty:
            return []
            
        }
    }
}
