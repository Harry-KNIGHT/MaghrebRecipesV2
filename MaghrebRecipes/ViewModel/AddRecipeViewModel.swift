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
    @Published var title: String = ""
    @Published var recipePrice: String = ""
    @Published var description: String = ""
    @Published var photo: String = ""
    @Published var recipeCategory: RecipeCategory = .entry
    
    func createRecipe() {
        let recipe = RecipeModel(title: title, price: Double(converter(text: recipePrice)) ?? 1, photo: photo, description: description, recipCategory: recipeCategory)
        self.myRecipes.insert(recipe, at: 0)
    }
    
    func removeLastRecipeInformation() {
        title = ""
        recipePrice = ""
        description = ""
        recipeCategory = .entry
    }
    
    func addRecipeButton() {
        createRecipe()
        removeLastRecipeInformation()

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
    
    
    func converter(text: String) -> String {
        let textDouble = Double(recipePrice.replacingOccurrences(of: ",", with: ".")) ?? 0
        // If the Textfield is empty, 0 will be returned
        return String(format: "%.2f", textDouble)
    }
}
