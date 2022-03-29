//
//  OrderView.swift
//  ExempleVideo
//
//  Created by Elliot Knight on 29/03/2022.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var recipeVM: RecipeViewModel
    var body: some View {
        NavigationView {
            VStack {
                if !recipeVM.recipeItems.isEmpty {
                        List {
                            Section {
                            ForEach(recipeVM.recipeItems) { recipe in
                                HStack {
                                        Text(recipe.title)
                                            .font(.headline)
                                    Spacer()
                                        Text(String(recipe.price) + "€")
                                }
                            }
                            .onDelete(perform: recipeVM.delet)
                            .onMove(perform: recipeVM.moveRecipe)
                        }
                            Section {
                                NavigationLink(destination: PaimentView()) {
                                    Text("Paiement")
                                        .foregroundColor(.blue)
                                }
                        }
                    
                        }.listStyle(.grouped)
                }else {
                    VStack {
                        Image(systemName: "cart.fill")
                            .font(.system(size: 50))
                        Text("Votre panier est vide ")
                            .font(.title)
                    }.foregroundStyle(.secondary)
                }
                
                  
            }
            .navigationTitle("Commander")
            .toolbar {
                EditButton()
            }
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
            .environmentObject(RecipeViewModel())
    }
}
