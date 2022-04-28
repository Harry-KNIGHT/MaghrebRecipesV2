//
//  VGridCell.swift
//  MaghrebRecipes
//
//  Created by Elliot Knight on 13/04/2022.
//

import SwiftUI

struct LazyHGridCell: View {
    let recipe: RecipeModel
    var body: some View {
            VStack(alignment: .leading) {
                LazyHGridImageCellView(recipe: recipe)
                HGridTitleCategoryView(recipe: recipe)
            }
            .background(Color.green)
            .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

struct LazyHGridCell_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LazyHGridCell(recipe: RecipeModel(title: "Maakdoua", photo: "gazelle", description: "La maaqouda, maqouda ou maakouda est un mets préparé et consommé en Algérie, au Maroc et en Tunisie, essentiellement pendant le mois de ramadan. Il s'agit d'une sorte de beignet de pommes de terre qui peut aussi se décliner avec du thon, de la viande hachée ou du fromage", ingredients: ["Pomme de terre", "Huile d'olive", "Origan"], recipCategory: .entry, recipeDifficulty: .easy, recipeAveragePrice: .cheap, valueTimeCooking: 25, timeToCook: .minute, vegetarianRecipe: true))
            
            LazyHGridCell(recipe: RecipeModel(title: "Maakdoua", photo: "maakouda", description: "La maaqouda, maqouda ou maakouda est un mets préparé et consommé en Algérie, au Maroc et en Tunisie, essentiellement pendant le mois de ramadan. Il s'agit d'une sorte de beignet de pommes de terre qui peut aussi se décliner avec du thon, de la viande hachée ou du fromage", ingredients: ["Pomme de terre", "Huile d'olive", "Origan"], recipCategory: .entry, recipeDifficulty: .easy, recipeAveragePrice: .cheap, valueTimeCooking: 25, timeToCook: .minute, vegetarianRecipe: false))
                .preferredColorScheme(.dark)
        }
    }
}

struct CustomPath: Shape {
    let radius: CGFloat
    let corners: UIRectCorner
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct HGridTitleCategoryView: View {
    let recipe: RecipeModel
    var body: some View {
        VStack(alignment: .leading) {
            Text(recipe.title)
                .font(.headline)
                .foregroundColor(.white)
            Text(recipe.recipCategory.rawValue)
                .foregroundColor(.white)
                .font(.callout)
        }
        .padding(.bottom)
        .padding(.leading)
    }
}

struct LazyHGridImageCellView: View {
    let recipe: RecipeModel
    let width: CGFloat = 180
    let height: CGFloat = 110
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
        Image(recipe.photo).resizable()
            .frame(width: width, height: height, alignment: .center)
            .clipShape(CustomPath(radius: 20, corners: [.topLeft, .topRight]))
            if recipe.vegetarianRecipe {
                VegetarianRecipePinGridView()
            }
        }
    }
}

struct  VegetarianRecipePinGridView: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        Image(systemName: "leaf")
            .font(.title3.bold())
            .padding(4)
            .foregroundColor(.green)
            .background(colorScheme == .dark ? Color.black : Color.white)
            .clipShape(CustomPath(radius: 10, corners: [.topLeft]))
    }
}
