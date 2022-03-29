//
//  ImageCellView.swift
//  ExempleVideo
//
//  Created by Elliot Knight on 26/03/2022.
//

import SwiftUI

struct ImageCellView: View {
    let recipe: RecipeModel
    var body: some View {
        Image(recipe.image).resizable()
            .frame(width: 150, height: 100, alignment: .center)
            .scaledToFit()
            .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

struct ImageCellView_Previews: PreviewProvider {
    static var previews: some View {
        ImageCellView(recipe:  RecipeModel(image: "b", title: "Couscous", wieght: 345, price: 12.35, description: "Notre tajine au poulet parfumé aux épices du Maroc est fait avec amour par notre chef.Des légumes du jours ainsi que de belles pièces de poulet accompagneront votre repas.", recipeCategory: .entree))
    }
}
