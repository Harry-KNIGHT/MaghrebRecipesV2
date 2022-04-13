//
//  ContentView.swift
//  ExempleVideo
//
//  Created by Elliot Knight on 29/03/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            RecipeListView()
                .tabItem {
                    Label("Recettes", systemImage: "list.bullet.circle.fill")
                }
            PersonalRecipeListView()
                .tabItem {
                    Label("Créations", systemImage: "book.closed.circle.fill")
            }
        }.accentColor(.green)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(FavoriteViewModel())
            .environmentObject(AddRecipeViewModel())
    }
}
