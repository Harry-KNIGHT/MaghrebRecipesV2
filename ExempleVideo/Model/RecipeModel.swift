//
//  RecipeModel.swift
//  ExempleVideo
//
//  Created by Elliot Knight on 26/03/2022.
//

import Foundation

struct RecipeModel: Identifiable {
    var id = UUID()
    let title: String
    let price: Double
    let photo: String
    let description: String
    let recipCategory: RecipeCategory
}

enum RecipeCategory: String, CaseIterable {
    case entry = "Entrée"
    case dish = "Plats"
    case dessert = "Desserts"
}


