//
//  RecipeImageView.swift
//  ExempleVideo
//
//  Created by Elliot Knight on 29/03/2022.
//

import SwiftUI

struct RecipeImageView: View {
    
    let recipe: RecipeModel
    var minWidth: CGFloat = 120
    var minHeight: CGFloat = 50
    var maxHeight: CGFloat = 80
    var maxWidth: CGFloat = 160
    var idealWidth: CGFloat = 130
    var idealHeight: CGFloat = 80
    var isShowingVege = true
    
    
    @Environment(\.colorScheme) var colorScheme
    var sfFontSize: Font = .title2
    var showingVegeWidth: CGFloat = 25
    var showingVegeHeight: CGFloat = 25
    var body: some View {
        if !recipe.photo.isEmpty {
            ZStack(alignment: .bottomTrailing) {
                Image(recipe.photo).resizable()
                    .frame(minWidth: minWidth, idealWidth: idealWidth, maxWidth: maxWidth, minHeight: minHeight, idealHeight: idealHeight, maxHeight: maxHeight)
                    
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                
                if recipe.vegetarianRecipe {
                Image(systemName: "leaf.circle.fill")
                    .font(sfFontSize)
                    .foregroundColor(.green)
                    .background(colorScheme == .light ? Color.white.clipShape(Circle()) :  Color.black.clipShape(Circle())
                    ).padding(-2)
                }
            }
        }else {
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .frame(minWidth: minWidth, idealWidth: idealWidth, maxWidth: maxWidth, minHeight: minHeight, idealHeight: idealHeight, maxHeight: maxHeight)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .foregroundColor(.secondary)
                Text("Maghreb Recipes")
                    .foregroundColor(.primary)
                    .font(.callout)
            }
        }
    }
}

struct RecipeImageView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RecipeImageView(recipe: RecipeModel(title: "Maakouda", photo: "maakouda", description: "La maaqouda, maqouda ou maakouda est un mets préparé et consommé en Algérie, au Maroc et en Tunisie, essentiellement pendant le mois de ramadan. Il s'agit d'une sorte de beignet de pommes de terre qui peut aussi se décliner avec du thon, de la viande hachée ou du fromage", ingredients: ["345G de fromage fondu"], recipCategory: RecipeCategory.entry, recipeDifficulty: .medium, recipeAveragePrice: .cheap, valueTimeCooking: 25, timeToCook: .minute, vegetarianRecipe: true))
                .preferredColorScheme(.light)
            RecipeImageView(recipe: RecipeModel(title: "Maakouda", photo: "maakouda", description: "La maaqouda, maqouda ou maakouda est un mets préparé et consommé en Algérie, au Maroc et en Tunisie, essentiellement pendant le mois de ramadan. Il s'agit d'une sorte de beignet de pommes de terre qui peut aussi se décliner avec du thon, de la viande hachée ou du fromage", ingredients: ["345G de fromage fondu"], recipCategory: RecipeCategory.entry, recipeDifficulty: .medium, recipeAveragePrice: .cheap, valueTimeCooking: 25, timeToCook: .minute, vegetarianRecipe: false))
                .preferredColorScheme(.dark)
        }
    }
}
