//
//  RecipeDetailView.swift
//  ExempleVideo
//
//  Created by Elliot Knight on 29/03/2022.
//

import SwiftUI

struct RecipeDetailView: View {
    @EnvironmentObject var recipeVM: RecipeViewModel
    let recipe: RecipeModel
    var body: some View {
        VStack {
            List {
                VStack(alignment: .leading) {
                    HStack {
                        
                        RecipeImageView(recipe: recipe, width: 350, height: 200)
                        Spacer()
                    }
                    HStack {
                        Text(recipe.title)
                            .foregroundStyle(.primary)
                            .font(.title2.bold())
                        Spacer()
                        Text(String(recipe.price * recipeVM.value) + "€")
                            .font(.headline)
                    }
                    Stepper("\(recipeVM.value.formatted()) \(recipe.title)") {
                        recipeVM.incremet()
                    } onDecrement: {
                        recipeVM.decrement()
                    }
                }
                Text(recipe.description)
                    .padding(.vertical)
                
            }.listStyle(.plain)
            
            Button("Commander") {
                // ajouter recette à la commande
                recipeVM.add(recipe: recipe)
                
            }
            .font(.title.bold())
            .buttonStyle(.borderedProminent)
            .navigationTitle(recipe.title)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView(recipe:  RecipeModel(title: "Maakouda", price: 7, photo: "maakouda", description: "La maaqouda, maqouda ou maakouda est un mets préparé et consommé en Algérie, au Maroc et en Tunisie, essentiellement pendant le mois de ramadan. Il s'agit d'une sorte de beignet de pommes de terre qui peut aussi se décliner avec du thon, de la viande hachée ou du fromage", recipCategory: .entry))
            .environmentObject(RecipeViewModel())
    }
}
