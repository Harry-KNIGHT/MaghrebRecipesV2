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
    let recipe: RecipeModel
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    RecipeImageView(recipe: recipe, width: 350, height: 220)
                
                }
                    HStack {
                        VStack(alignment: .leading, spacing: 5) {
                        Text(recipe.title)
                            .foregroundStyle(.primary)
                            .font(.title2.bold())
                        
                        Text(String(recipe.price * recipeVM.value) + "€")
                            .font(.headline)
                        }
                        Spacer()
                    }
                Divider()

                Stepper("\(recipeVM.value.formatted()) \(recipeVM.value > 1 ? "menus" : "menu")") {
                    recipeVM.incremet()
                } onDecrement: {
                    recipeVM.decrement()
                }.padding(.vertical, 3)
                
                Divider()
                VStack(alignment: .leading, spacing: 5) {
                Text("Description:")
                    .font(.headline)
                Text(recipe.description)
                    .padding(.vertical)
                }.padding(.vertical)
            }
            
            Button("Commander") {
                // ajouter recette à la commande
                recipeVM.add(recipe: recipe)
            }.padding(.bottom)
            .font(.title.bold())
            .buttonStyle(.borderedProminent)
            .navigationTitle(recipe.title)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button(action: {
                
                
                if !favoriteVM.favoritesRecipes.contains(recipe) {
                    favoriteVM.add(recipe: recipe)
                }else {
                    self.favoriteVM.favoritesRecipes.removeAll {
                        $0.id == recipe.id
                    }
                    print("Already liked")
                }
            }, label: {
                Image(systemName:  favoriteVM.favoritesRecipes.contains(recipe) ? "heart.fill" : "heart" )
            }))
        }.padding(.horizontal)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RecipeDetailView(recipe:  RecipeModel(title: "Maakouda", price: 7, photo: "maakouda", description: "La maaqouda, maqouda ou maakouda est un mets préparé et consommé en Algérie, au Maroc et en Tunisie, essentiellement pendant le mois de ramadan. Il s'agit d'une sorte de beignet de pommes de terre qui peut aussi se décliner avec du thon, de la viande hachée ou du fromage", recipCategory: .entry))
                .environmentObject(RecipeViewModel())
                .environmentObject(FavoriteViewModel())
        }
    }
}
