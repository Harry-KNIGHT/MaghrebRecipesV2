//
//  AddRecipeFormButtonView.swift
//  MaghrebRecipes
//
//  Created by Elliot Knight on 20/04/2022.
//

import SwiftUI

/*
 
 Commented due to the presentationmode bug dissmissing view when form is filled
struct AddRecipeFormButtonView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var recipeVM: AddRecipeViewModel

     var title: String = ""
     var description: String = ""
     var photo: String = ""
     var ingredient: String = ""
     var recipeCategory : RecipeCategory = .entry
     var allIngredients = [String]()
     var recipeDifficulty: RecipeDifficulty = .easy
     var recipeAveragePrice: RecipeAveragePrice = .cheap
     var recipeValueTimeCooking: String = ""
     var recipeTimeToCook: TimeToCook = .minute
     var isVegetarian: Bool = false
    
    
    var body: some View {
        Button(action: {
            if !title.isEmpty && !description.isEmpty {
                //                 addRecipeButton has now parameters, all info needed to create a recipe (View model has been modified too)
                recipeVM.addRecipeButton(title: title, photo: photo, description: description, allIngredients: allIngredients, category: recipeCategory, difficulty: recipeDifficulty, averagePrice: recipeAveragePrice, cookingTime: Double(recipeValueTimeCooking) ?? 0, timeToCook: recipeTimeToCook, vegetarienRecipe: isVegetarian)
                self.presentationMode.wrappedValue.dismiss()
                self.recipeVM.simpleSuccesHaptic()
            }
        }, label: {
            Text("Créer")
        })
        .buttonPersonnalStyle(colorModifier: !title.isEmpty && !description.isEmpty ? .green : .secondary)
        .buttonPersonnalStyle(.title3)
    }
}

struct AddRecipeFormButtonView_Previews: PreviewProvider {
    static var previews: some View {
        AddRecipeFormButtonView()
    }
}
*/
