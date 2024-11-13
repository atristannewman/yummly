//
//  Recipe.swift
//  Yummly
//
//  Created by Tristan Newman on 11/11/24.
//

import Foundation

struct RecipeResponse: Codable {
    let recipes: [Recipe]
}

struct Recipe: Codable, Identifiable {
    let cuisine: String
    let name: String
    let photoURLLarge: String?
    let photoURLSmall: String?
    let id: String
    let sourceURL: String?
    let youtubeURL: String?
    
    enum CodingKeys: String, CodingKey {
        case cuisine, name
        case photoURLLarge = "photo_url_large"
        case photoURLSmall = "photo_url_small"
        case id = "uuid"
        case sourceURL = "source_url"
        case youtubeURL = "youtube_url"
    }
}
