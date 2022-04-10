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
    @Published var recipeCategory: RecipeCategory = .dish
    

    
    func createRecipe() {
        let recipe = RecipeModel(title: title, price: Double(price) ?? 0, photo: photo, description: description, recipCategory: recipeCategory)
        self.myRecipes.insert(recipe, at: 0)
    }
    
    
    func addRecipeButton() {
            createRecipe()
            title = ""
            price = ""
            description = ""
            recipeCategory = .entry

    }
    
    func delet(at offsets: IndexSet) {
        myRecipes.remove(atOffsets: offsets)
    }
    
    func removeAll() {
        self.myRecipes.removeAll()
    }
    
    func move(from offsets: IndexSet, to destination: Int) {
        self.myRecipes.move(fromOffsets: offsets, toOffset: destination)
    }
}
