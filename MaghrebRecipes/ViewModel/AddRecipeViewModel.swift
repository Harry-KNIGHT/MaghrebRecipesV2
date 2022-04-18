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
    
    func createRecipe(title : String, photo: String, description: String, allIngredients: [String], category : RecipeCategory, difficulty: RecipeDifficulty, averagePrice: RecipeAveragePrice, cookingTime: Double, timeToCook: TimeToCook, vegetarianRecipe: Bool) {
        let recipe = RecipeModel(title: title, photo: photo, description: description,ingredients: allIngredients, recipCategory: category, recipeDifficulty: difficulty, recipeAveragePrice: averagePrice, valueTimeCooking: cookingTime, timeToCook: timeToCook, vegetarianRecipe: vegetarianRecipe)
        self.myRecipes.insert(recipe, at: 0)
    }
    
    func addRecipeButton(title : String, photo: String, description: String, allIngredients: [String], category : RecipeCategory, difficulty: RecipeDifficulty, averagePrice: RecipeAveragePrice, cookingTime: Double, timeToCook: TimeToCook, vegetarienRecipe: Bool) {
        createRecipe(title: title, photo: photo, description: description, allIngredients: allIngredients , category: category, difficulty: difficulty, averagePrice: averagePrice, cookingTime: cookingTime, timeToCook: timeToCook, vegetarianRecipe: vegetarienRecipe)
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
