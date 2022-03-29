//
//  RecipeImageView.swift
//  ExempleVideo
//
//  Created by Elliot Knight on 29/03/2022.
//

import SwiftUI

struct RecipeImageView: View {
    
    let recipe: RecipeModel
    var width: CGFloat = 150
    var height: CGFloat = 100
    
    var body: some View {
        Image(recipe.photo).resizable()
            .frame(width: width, height: height, alignment: .center)
            .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

struct RecipeImageView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeImageView(recipe:  RecipeModel(title: "Maakouda", price: 7, photo: "maakouda", description: "La maaqouda, maqouda ou maakouda est un mets préparé et consommé en Algérie, au Maroc et en Tunisie, essentiellement pendant le mois de ramadan. Il s'agit d'une sorte de beignet de pommes de terre qui peut aussi se décliner avec du thon, de la viande hachée ou du fromage", recipCategory: .entry))
    }
}
