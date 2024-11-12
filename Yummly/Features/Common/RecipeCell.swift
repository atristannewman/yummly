//
//  RecipeCell.swift
//  Yummly
//
//  Created by Tristan Newman on 11/12/24.
//

import SwiftUI
import Kingfisher

struct RecipeCell: View {
    let recipeName: String
    let recipeUrl: URL?
    let recipeCuisineType: String
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            if let url = recipeUrl {
                KFImage(url)
                    .resizable()
                    .clipped()
            } else {
                Image(systemName: "photo")
                    .resizable()
                    .clipped()
                    .foregroundColor(.gray)
            }
            
            VStack(alignment: .leading) {
                Text(recipeName)
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.white)
                
                Text(recipeCuisineType)
                    .font(.system(size: 14))
                    .foregroundColor(.white)
            }
            .padding(9)
            .background(Color.black.opacity(0.5))
            .cornerRadius(4)
            .shadow(radius: 4)
        }
        .frame(height: 200)
        .cornerRadius(4)
        .clipped()
    }
}
