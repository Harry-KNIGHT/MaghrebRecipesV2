//
//  CreatedRecipeDetailView.swift
//  MaghrebRecipes
//
//  Created by Elliot Knight on 15/04/2022.
//

import SwiftUI

struct CreatedRecipeDetailView: View {
    @EnvironmentObject var favoriteVM: FavoriteViewModel
    @EnvironmentObject var addRecipeVM: AddRecipeViewModel
    let recipe: RecipeModel
    var body: some View {
        VStack {
            List {
                RecipeImageView(recipe: recipe, width: 355, height: 220)
                RecipeTitleCategoryDetailEctractedView(recipe: recipe)
                HStack {
                    Text("Prix moyen: ")
                    Text("\(recipe.price    )")
                }
                RecipeDescriptionDetailExtractedView(recipe: recipe)
            }.listStyle(.inset)
        }.modifier(Navigation(recipe: recipe))
    }
}

struct CreatedRecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CreatedRecipeDetailView(recipe:  RecipeModel(title: "Maakouda", price: 23.2, photo: "maakouda", description: "La maaqouda, maqouda ou maakouda est un mets préparé et consommé en Algérie, au Maroc et en Tunisie, essentiellement pendant le mois de ramadan. Il s'agit d'une sorte de beignet de pommes de terre qui peut aussi se décliner avec du thon, de la viande hachée ou du fromage", recipCategory: .entry))
                .environmentObject(FavoriteViewModel())
            .environmentObject(AddRecipeViewModel())
            CreatedRecipeDetailView(recipe:  RecipeModel(title: "Maakouda", price: 7, photo: "", description: "La maaqouda, maqouda ou maakouda est un mets préparé et consommé en Algérie, au Maroc et en Tunisie, essentiellement pendant le mois de ramadan. Il s'agit d'une sorte de beignet de pommes de terre qui peut aussi se décliner avec du thon, de la viande hachée ou du fromage", recipCategory: .entry))
                .preferredColorScheme(.dark)
                .environmentObject(FavoriteViewModel())
                .environmentObject(AddRecipeViewModel())
        }
    }
}
