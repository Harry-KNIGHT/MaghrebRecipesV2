//
//  ItemDetailView.swift
//  ExempleVideo
//
//  Created by Elliot Knight on 26/03/2022.
//

import SwiftUI

struct ItemDetailView: View {
    let recipe: RecipeModel
    var body: some View {
        VStack(alignment: .center) {
            ScrollView(.vertical, showsIndicators: false) {
                Image(recipe.image).resizable()
                    .frame(height: 200)
                    .scaledToFit()
                
                HStack {
                    Text(recipe.title)
                        .font(.title.bold())
                    Spacer()
                    Text(String(recipe.price))
                        .font(.headline)
                        .foregroundColor(.teal)
                }.padding()
                VStack(alignment: .leading, spacing: 10) {
                    Text("Detail")
                        .bold()
                    
                    Text(recipe.description)
                        .multilineTextAlignment(.leading)
                }     .padding(.horizontal)
            }
            Button("Ajouter au panier") {
                // Commander
            }.font(.title.bold())
                .buttonStyle(.borderedProminent)
        }.navigationTitle(recipe.title)
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ItemDetailView(recipe:  RecipeModel(image: "b", title: "Couscous", wieght: 345, price: 12.35, description: "Notre tajine au poulet parfumé aux épices du Maroc est fait avec amour par notre chef.Des légumes du jours ainsi que de belles pièces de poulet accompagneront votre repas.", recipeCategory: .entree))
        }
    }
}
