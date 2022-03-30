//
//  MaghrebRecipesApp.swift
//  ExempleVideo
//
//  Created by Elliot Knight on 26/03/2022.
//

import SwiftUI

@main
struct MaghrebRecipesApp: App {
    
    @StateObject var recipeViewModel = RecipeViewModel()
    @StateObject var favoriteViewModel = FavoriteViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(RecipeViewModel())
                .environmentObject(FavoriteViewModel())
        }
    }
}
