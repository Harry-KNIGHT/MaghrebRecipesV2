//
//  RecipeViewModel.swift
//  ExempleVideo
//
//  Created by Elliot Knight on 29/03/2022.
//

import Foundation

class RecipeViewModel: ObservableObject {
    @Published var recipeItems = [RecipeModel]()
    
    @Published public var selection = "Carte bleue"
    var paiments = ["Especes", "Carte bleue", "BTC"]
    
    @Published public var isOn: Bool = false
    @Published public var textFieldMail = ""
    
    @Published var value: Double = 1
    
    @Published var search: String = ""
    
    
    var total: Double {
        if recipeItems.count > 0 {
            return recipeItems.reduce(0) { $0 + $1.price }
        }else {
            return 0
        }
    }
    
    
    func add(recipe: RecipeModel) {
        recipeItems.append(recipe)
    }
    
    func delet(at offsets: IndexSet) {
        recipeItems.remove(atOffsets: offsets)
    }
    
    func moveRecipe(at offsets: IndexSet, to destination: Int) {
        recipeItems.move(fromOffsets: offsets, toOffset: destination)
    }
    
    
    func incremet() {
        value += 1
        
        if value > 10 {
            value = 10
            print("You cant add more items")
        }
    }
    
    func decrement() {
        value -= 1
        
        if value < 1 {
            value = 1
            print("You cant get no recipes")
        }
    }
}
