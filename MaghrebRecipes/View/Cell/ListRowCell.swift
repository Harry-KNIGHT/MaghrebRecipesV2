//
//  ListRowCell.swift
//  MaghrebRecipes
//
//  Created by Elliot Knight on 27/04/2022.
//

import SwiftUI

struct ListRowCell: View {
    let recipe: RecipeModel
    @EnvironmentObject var favoriteVM: FavoriteViewModel

    var body: some View {
        NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
            HStack(alignment: .center) {
                RecipeImageView(recipe: recipe)
                VStack(alignment: .leading, spacing: 5) {
                    HStack {
                    Text(recipe.title)
                        .font(.headline)
                        .lineLimit(1)
                        Spacer()
                        
                        if favoriteVM.favoritesRecipes.contains(recipe) {
                            Image(systemName: "heart.fill")
                                .buttonPersonnalStyle()
                        }
                    }
                    Text(recipe.description)
                        .font(.subheadline)
                        .lineLimit(2)
                        .foregroundColor(.secondary)
                }
            }
        }
    }
}

struct ListRowCell_Previews: PreviewProvider {
    static var previews: some View {
        ListRowCell(recipe: RecipeModel(title: "Maakouda", photo: "maakouda", description: "La maaqouda, maqouda ou maakouda est un mets préparé et consommé en Algérie, au Maroc et en Tunisie, essentiellement pendant le mois de ramadan. Il s'agit d'une sorte de beignet de pommes de terre qui peut aussi se décliner avec du thon, de la viande hachée ou du fromage", ingredients: ["345G de fromage fondu"], recipCategory: RecipeCategory.entry, recipeDifficulty: .medium, recipeAveragePrice: .cheap, valueTimeCooking: 25, timeToCook: .minute, vegetarianRecipe: true))
            .environmentObject(FavoriteViewModel())
    }
}
