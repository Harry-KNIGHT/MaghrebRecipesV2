//
//  RecipeModel.swift
//  ExempleVideo
//
//  Created by Elliot Knight on 26/03/2022.
//

import Foundation

/// Model of recipe object
struct RecipeModel: Identifiable, Equatable {
    var id = UUID()
    let title: String
    let photo: String
    let description: String
    let ingredients: [String]

    let recipCategory: RecipeCategory
    let recipeDifficulty: RecipeDifficulty
    let recipeAveragePrice: RecipeAveragePrice
    let valueTimeCooking: Int
    let timeToCook: TimeToCook
}

/// Category of recipes
enum RecipeCategory: String, CaseIterable {
    case entry = "Entrée"
    case dish = "Plat"
    case dessert = "Dessert"
}


enum RecipeDifficulty: String, CaseIterable {
    case easy = "Facile"
    case medium = "Moyenne"
    case hard = "Avancée"
}

enum RecipeAveragePrice: String, CaseIterable {
    case cheap = "Économique"
    case medium = "Moyen"
    case expensive = "Cher"
}

enum TimeToCook: String, CaseIterable {
    case minute = "Minutes"
    case hour = "Heures"
    case day = "Jours"
}
