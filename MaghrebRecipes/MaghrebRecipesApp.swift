//
//  MaghrebRecipesApp.swift
//  MaghrebRecipes
//
//  Created by Elliot Knight on 26/03/2022.
//

import SwiftUI

@main
struct MaghrebRecipesApp: App {
    @StateObject var favoriteViewModel = FavoriteViewModel()
    @StateObject var addRecipe = AddRecipeViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(FavoriteViewModel())
                .environmentObject(AddRecipeViewModel())
        }
    }
}
