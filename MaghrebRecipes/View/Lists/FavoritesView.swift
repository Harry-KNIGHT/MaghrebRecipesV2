//
//  FavoritesView.swift
//  MaghrebRecipes
//
//  Created by Elliot Knight on 30/03/2022.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var favoriteVM: FavoriteViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            VStack {
                if !favoriteVM.favoritesRecipes.isEmpty {
                    List {
                        Section {
                            ForEach(favoriteVM.favoritesRecipes) { recipe in
                                NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                                    HStack(alignment: .center) {
                                        RecipeImageView(recipe: recipe)
                                        TitleDescriptionView(recipe: recipe)
                                    }
                                }
                            }
                            .onDelete(perform: favoriteVM.delet)
                            .onMove(perform: favoriteVM.move)
                        }
                    }
                    .listStyle(.inset)
                }else {
                    EmptyView(imageName: Image(systemName: "heart.fill"), title: "Pas de favoris")
                }
            }
            .navigationTitle("Favoris")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    
                    if !favoriteVM.favoritesRecipes.isEmpty {
                        Button("Vider") {
                            favoriteVM.isPresented = true
                        }.alert("Supprimer tous vos favoris ?", isPresented: $favoriteVM.isPresented) {
                            Button("Oui", role: .destructive) {
                                favoriteVM.removeAllFavoriteRecipes()
                                self.presentationMode.wrappedValue.dismiss()
                            }
                        }
                    }
                }
                
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "chevron.down")
                    })
                }
            }
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
            .environmentObject(FavoriteViewModel())
    }
}
