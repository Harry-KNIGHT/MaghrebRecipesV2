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
                                            .font(.headline)
                                        VStack(alignment: .leading, spacing: 5) {
                                            Text(recipe.title)
                                                .font(.headline)
                                            Text(String(recipe.price) + "€")
                                            Text(recipe.description)
                                                .foregroundColor(.secondary)
                                                .font(.subheadline)
                                                .lineLimit(2) 
                                        }
                                    }
                                }
                            }
                            .onDelete(perform: favoriteVM.delet)
                            .onMove(perform: favoriteVM.move)
                        }
                    }
                    .listStyle(.inset)
                }else {
                    EmptyView(imageName: "heart.fill", title: "Pas de favoris")
                }
            }
            .navigationTitle("Favoris")
            .toolbar {
                if !favoriteVM.favoritesRecipes.isEmpty {
                    Button("Tout supprimer") {
                        favoriteVM.isPresented = true
                    }.alert("Supprimer tous vos favoris ?", isPresented: $favoriteVM.isPresented) {
                        Button("Oui", role: .cancel) {
                            favoriteVM.removeAll()
                            self.presentationMode.wrappedValue.dismiss()
                        }
                        Button("Non") { }
                    }
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
