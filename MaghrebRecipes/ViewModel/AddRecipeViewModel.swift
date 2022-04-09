//
//  AddRecipeViewModel.swift
//  MaghrebRecipes
//
//  Created by Elliot Knight on 08/04/2022.
//

import Foundation
class AddRecipeViewModel: ObservableObject {
    @Published var myRecipes: [RecipeModel] = []
    @Published var isSheetOn = false
    @Published var title: String = ""
    @Published var price: String = ""
    @Published var description: String = ""
    @Published var photo: String = ""
    @Published var recipeCategory: RecipeCategory = .entry
    

    
    func createRecipe() {
        let recipe = RecipeModel(title: title, price: Double(price) ?? 0, photo: photo, description: description, recipCategory: recipeCategory)
        self.myRecipes.append(recipe)
    }
    
    
    func addRecipeButton() {
            createRecipe()
            title = ""
            price = ""
            description = ""
            recipeCategory = .entry

    }
}
