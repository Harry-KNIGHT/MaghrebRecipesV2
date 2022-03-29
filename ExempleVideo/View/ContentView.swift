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
            OrderView()
                .tabItem {
                    Label("Order", systemImage: "bag.circle.fill")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(RecipeViewModel())
    }
}
