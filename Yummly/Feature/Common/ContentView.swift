//
//  ContentView.swift
//  Yummly
//
//  Created by Tristan Newman on 11/11/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = RecipeListViewModel()
    
    var body: some View {
        NavigationView {
            VStack { // When another Feature/Screen is added this will likely change into a TabView
                Label("Hello world!", systemImage: "star")
            }
            
        }.onAppear() {
            Task {
                try await viewModel.onAppear()
            }
            
        }
    }
}

#Preview {
    ContentView()
}
