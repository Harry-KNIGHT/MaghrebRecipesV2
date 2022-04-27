//
//  LazyVGridView.swift
//  MaghrebRecipes
//
//  Created by Elliot Knight on 13/04/2022.
//

import SwiftUI

struct LazyHGridView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Sélections du moment ")
                .foregroundStyle(.green)
                .font(.headline)
                .padding(.leading)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(recipes.shuffled()) { recipe in
                        NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                            LazyHGridCell(recipe: recipe)
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

struct LazyHGridView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LazyHGridView()
                .environmentObject(FavoriteViewModel())
                .environmentObject(AddRecipeViewModel())
            LazyHGridView()
                .preferredColorScheme(.dark)
                .environmentObject(FavoriteViewModel())
                .environmentObject(AddRecipeViewModel())
        }
    }
}
