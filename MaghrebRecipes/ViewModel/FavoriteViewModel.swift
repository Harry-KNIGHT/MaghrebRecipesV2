//
//  FavoriteViewModel.swift
//  MaghrebRecipes
//
//  Created by Elliot Knight on 30/03/2022.
//

import Foundation


class FavoriteViewModel: ObservableObject {
    @Published var favoritesRecipes: [RecipeModel] = []
    @Published var isPresented: Bool = false
    @Published var isSheetOn: Bool = false

    func add(recipe: RecipeModel) {
        self.favoritesRecipes.insert(recipe, at: 0)
    }
    
    /// Move item on array from the view
    /// - Parameters: Index for catch the item from int for move it at the right place
    ///   - offsets: Index at the item is taken
    ///   - destination: Number in the array where the item is moved
    func move(from offsets: IndexSet, to destination: Int) {
        self.favoritesRecipes.move(fromOffsets: offsets, toOffset: destination)
    }
    
    func delet(at offset: IndexSet) {
        self.favoritesRecipes.remove(atOffsets: offset)
    }
    
    func removeFavoriteRecipe(recipe: RecipeModel) {
        self.favoritesRecipes.removeAll { $0.id == recipe.id }
    }
    
    /// This function watch if the array of favoriteRecipes contains or not the recipe for delet or add to favorite conforming to RecipeModel.
    /// - Parameter recipe: RecipeModel
    func addOrRemove(recipe: RecipeModel) {
        if favoritesRecipes.contains(recipe) {
            removeFavoriteRecipe(recipe: recipe)
        }else {
            add(recipe: recipe)
        }
    }
    
    /// Remove all the favorite recipe in the array
    func removeAllFavoriteRecipes() {
        self.favoritesRecipes.removeAll()
    }
}
