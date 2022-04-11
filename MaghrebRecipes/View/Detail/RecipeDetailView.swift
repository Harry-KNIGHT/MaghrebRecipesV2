//
//  RecipeDetailView.swift
//  ExempleVideo
//
//  Created by Elliot Knight on 29/03/2022.
//

import SwiftUI

struct RecipeDetailView: View {
    @EnvironmentObject var recipeVM: RecipeViewModel
    @EnvironmentObject var favoriteVM: FavoriteViewModel
    @EnvironmentObject var addRecipeVM: AddRecipeViewModel
    let recipe: RecipeModel
    var body: some View {
        VStack {
            List {
                RecipeImageView(recipe: recipe, width: 355, height: 220)
                HStack {
                    Text(recipe.title)
                        .foregroundStyle(.primary)
                        .font(.title2.bold())
                    Spacer()
                    Text(recipe.recipCategory.rawValue)
                        .foregroundColor(.secondary)
                        .font(.headline)
                }
                
                HStack {
                    Text("Prix moyen:")
                    Text(String(recipe.price.formatted()) + "€")
                }
                VStack(alignment: .leading, spacing: 10) {
                    Text("Description:")
                        .font(.headline)
                    Text(recipe.description)
                }
            }.listStyle(.inset)
            
            if !addRecipeVM.myRecipes.contains(recipe) {
                Button("Commander") {
                    // ajouter recette à la commande
                    recipeVM.add(recipe: recipe)
                }.padding(.bottom)
                    .font(.title.bold())
                    .buttonStyle(.borderedProminent)
            }else {}
        }.modifier(Navigation(recipe: recipe))
    }
}

struct Navigation: ViewModifier {
    let recipe: RecipeModel
    @EnvironmentObject var recipeVM: RecipeViewModel
    @EnvironmentObject var favoriteVM: FavoriteViewModel
    func body(content: Content) -> some View {
        content
            .navigationTitle(recipe.title)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button(action: {
                favoriteVM.addOrRemove(recipe: recipe)
            }, label: {
                Image(systemName:  favoriteVM.favoritesRecipes.contains(recipe) ? "heart.fill" : "heart" )
            }))
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RecipeDetailView(recipe:  RecipeModel(title: "Maakouda", price: 7, photo: "maakouda", description: "La maaqouda, maqouda ou maakouda est un mets préparé et consommé en Algérie, au Maroc et en Tunisie, essentiellement pendant le mois de ramadan. Il s'agit d'une sorte de beignet de pommes de terre qui peut aussi se décliner avec du thon, de la viande hachée ou du fromage", recipCategory: .entry))
                .environmentObject(RecipeViewModel())
                .environmentObject(FavoriteViewModel())
                .environmentObject(AddRecipeViewModel())
        }
    }
}

