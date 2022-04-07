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
    
    func add(recipe: RecipeModel) {
        self.favoritesRecipes.append(recipe)
    }
    
    func move(from offsets: IndexSet, to destination: Int) {
        self.favoritesRecipes.move(fromOffsets: offsets, toOffset: destination)
    }
    
    func delet(at offset: IndexSet) {
        self.favoritesRecipes.remove(atOffsets: offset)
    }
    
    func removeFavoriteRecipe(recipe: RecipeModel) {
        self.favoritesRecipes.removeAll { $0.id == recipe.id }
    }
    func addOrRemove(recipe: RecipeModel) {
        if favoritesRecipes.contains(recipe) {
            removeFavoriteRecipe(recipe: recipe)
        }else {
            add(recipe: recipe)
        }
    }
    
    func removeAll() {
        self.favoritesRecipes.removeAll()
    }
}
