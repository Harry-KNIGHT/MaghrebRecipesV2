//
//  LikeButtonCell.swift
//  MaghrebRecipes
//
//  Created by Elliot Knight on 11/04/2022.
//

import SwiftUI

struct LikeButtonDetailViewCell: View {
   @EnvironmentObject var favoriteVM: FavoriteViewModel
    let recipe: RecipeModel
    var body: some View {
        Button(action: {
            favoriteVM.addOrRemove(recipe: recipe)
            self.favoriteVM.addOrRemoveHaptic(recipe: recipe)
        }, label: {
            Image(systemName: favoriteVM.favoritesRecipes.contains(recipe) ? "heart.fill" : "heart")
        })
        .buttonPersonnalStyle()
    }
}

struct LikeButtonDetailViewCell_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LikeButtonDetailViewCell(recipe: RecipeModel(title: "Maakouda", price: 7, photo: "maakouda", description: "La maaqouda, maqouda ou maakouda est un mets préparé et consommé en Algérie, au Maroc et en Tunisie, essentiellement pendant le mois de ramadan. Il s'agit d'une sorte de beignet de pommes de terre qui peut aussi se décliner avec du thon, de la viande hachée ou du fromage", ingredients: ["345G de fromage fondu"], recipCategory: RecipeCategory.entry))
                .environmentObject(FavoriteViewModel())
            LikeButtonDetailViewCell(recipe: RecipeModel(title: "Maakouda", price: 7, photo: "maakouda", description: "La maaqouda, maqouda ou maakouda est un mets préparé et consommé en Algérie, au Maroc et en Tunisie, essentiellement pendant le mois de ramadan. Il s'agit d'une sorte de beignet de pommes de terre qui peut aussi se décliner avec du thon, de la viande hachée ou du fromage", ingredients: ["345G de fromage fondu"], recipCategory: RecipeCategory.entry))
                .preferredColorScheme(.dark)
                .environmentObject(FavoriteViewModel())
        }
    }
}
