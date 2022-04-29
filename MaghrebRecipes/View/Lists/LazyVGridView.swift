//
//  LazyVGridView.swift
//  MaghrebRecipes
//
//  Created by Elliot Knight on 28/04/2022.
//

import SwiftUI

struct LazyVGridView: View {
    let recipe: RecipeModel
    let columns = [
        GridItem(.flexible(minimum: 80))
    ]
    
    var body: some View {
        
            LazyVGrid(columns: columns, spacing: 20) {
                LazyGridCell(recipe: recipe, width: .infinity, height: 200)
                    .padding(.horizontal)
                    .shadow(radius: 10)
            
        }
    }
}

struct LazyVGridView_Previews: PreviewProvider {
    static var previews: some View {
        LazyVGridView(recipe: RecipeModel(title: "Maakdoua", photo: "gazelle", description: "La maaqouda, maqouda ou maakouda est un mets préparé et consommé en Algérie, au Maroc et en Tunisie, essentiellement pendant le mois de ramadan. Il s'agit d'une sorte de beignet de pommes de terre qui peut aussi se décliner avec du thon, de la viande hachée ou du fromage", ingredients: ["Pomme de terre", "Huile d'olive", "Origan"], recipCategory: .entry, recipeDifficulty: .easy, recipeAveragePrice: .cheap, valueTimeCooking: 25, timeToCook: .minute, vegetarianRecipe: true))
    }
}
