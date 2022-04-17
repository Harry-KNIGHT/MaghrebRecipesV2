//
//  AddRecipeViewModel.swift
//  MaghrebRecipes
//
//  Created by Elliot Knight on 08/04/2022.
//

import Foundation
import SwiftUI

class AddRecipeViewModel: ObservableObject {
    @Published var myRecipes: [RecipeModel] = []
    @Published var isSheetOn = false
    
    func createRecipe(title : String, price : String, description: String, ingredients: [String], category : RecipeCategory) {
        let recipe = RecipeModel(title: title, price: Double(price.replacingOccurrences(of: ",", with: ".")) ?? 1, photo: "", description: description,ingredients: Array(ingredients), recipCategory: category)
        self.myRecipes.insert(recipe, at: 0)
    }
    
    func addRecipeButton(title : String, price : String, description: String, ingredient: String, category : RecipeCategory) {
        createRecipe(title: title, price: price, description: description, ingredients: Array(arrayLiteral: ingredient), category: category)
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
    
    func simpleSuccesHaptic() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.warning)
    }
    
}
