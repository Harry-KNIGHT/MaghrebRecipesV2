//
//  FavoritesView.swift
//  MaghrebRecipes
//
//  Created by Elliot Knight on 30/03/2022.
//

import SwiftUI

struct FavoritesListView: View {
    @EnvironmentObject var favoriteVM: FavoriteViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            VStack {
                if !favoriteVM.favoritesRecipes.isEmpty {
                    ExtractedFavoriteListView()
                }else {
                    EmptyView(imageName: Image(systemName: "heart.fill"), title: "Pas de favoris")
                }
            }
            .navigationTitle("Favoris")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    if !favoriteVM.favoritesRecipes.isEmpty {
                        Button(action: {
                            favoriteVM.isPresented = true
                        }, label: {
                            Label("Supprimer tous les favoris", systemImage: "trash.circle.fill")
                        }).buttonPersonnalStyle()
                            .alert("Supprimer tous vos favoris ?", isPresented: $favoriteVM.isPresented) {
                                Button("Delet", role: .destructive) {
                                    favoriteVM.removeAllFavoriteRecipes()
                                    self.presentationMode.wrappedValue.dismiss()
                                }
                            }
                    }
                }
            }
        }
    }
}

struct FavoritesListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FavoritesListView()
                .environmentObject(FavoriteViewModel())
            FavoritesListView()
                .preferredColorScheme(.dark)
                .environmentObject(FavoriteViewModel())
        }
    }
}

struct ExtractedFavoriteListView: View {
    @EnvironmentObject var favoriteVM: FavoriteViewModel
    var body: some View {
        List {
            ForEach(favoriteVM.favoritesRecipes) { recipe in
                ListRowCell(recipe: recipe)
            }
            .onDelete(perform: favoriteVM.delet)
            .onMove(perform: favoriteVM.move)
        }
        .listStyle(.automatic)
    }
}
