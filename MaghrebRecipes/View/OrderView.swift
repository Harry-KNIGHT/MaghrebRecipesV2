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
                        Section(header: Text(String(recipeVM.total) + "€")) {
                            NavigationLink(destination: PaimentView()) {
                                Text("Paiement")
                                    .foregroundColor(.blue)
                            }
                        }
                    }       .listStyle(.inset)
                }else {
                    EmptyView(imageName: Image(systemName: "cart.fill"), title: "Panier vide")
                }   
            }
            .navigationTitle("Commander")
            .toolbar {
                if !recipeVM.recipeItems.isEmpty {
                    EditButton()
                }
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
