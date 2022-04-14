//
//  LikeButtonCell.swift
//  MaghrebRecipes
//
//  Created by Elliot Knight on 11/04/2022.
//

import SwiftUI

struct LikeButtonCell: View {
   @EnvironmentObject var favoriteVM: FavoriteViewModel
    let recipe: RecipeModel
    var body: some View {
        Button(action: {
            favoriteVM.addOrRemove(recipe: recipe)
            self.favoriteVM.addOrRemoveHaptic(recipe: recipe)
        }, label: {
            Image(systemName: favoriteVM.favoritesRecipes.contains(recipe) ? "heart.fill" : "heart")
        }).foregroundColor(.green)
    }
}

struct LikeButtonCell_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LikeButtonCell(recipe:   RecipeModel(title: "Briouats fromage", price: 5, photo: "briouats", description: "La briouate fromage est une entrée que l’on prépare pour le Ramadan et qui accompagne d’autres plats comme la chorba. La cuisson au four est idéale pour éviter que ce soit trop gras et permet d’avoir un côté croustillant délicieux avec le fondant du fromage : un vrai régal ! Cette recette est très facile et rapide à faire.", recipCategory: .entry))
                .environmentObject(FavoriteViewModel())
            LikeButtonCell(recipe:   RecipeModel(title: "Briouats fromage", price: 5, photo: "briouats", description: "La briouate fromage est une entrée que l’on prépare pour le Ramadan et qui accompagne d’autres plats comme la chorba. La cuisson au four est idéale pour éviter que ce soit trop gras et permet d’avoir un côté croustillant délicieux avec le fondant du fromage : un vrai régal ! Cette recette est très facile et rapide à faire.", recipCategory: .entry))
                .preferredColorScheme(.dark)
                .environmentObject(FavoriteViewModel())
        }
    }
}
