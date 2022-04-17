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
    let price: Double
    let photo: String
    let description: String
    let ingredients: [String]
    let recipCategory: RecipeCategory
}

/// Category of recipes
enum RecipeCategory: String, CaseIterable {
    case entry = "Entrée"
    case dish = "Plat"
    case dessert = "Dessert"
}
