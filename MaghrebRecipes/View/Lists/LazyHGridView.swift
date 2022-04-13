//
//  LazyVGridView.swift
//  MaghrebRecipes
//
//  Created by Elliot Knight on 13/04/2022.
//

import SwiftUI

struct LazyHGridView: View {
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(recipes.shuffled()) { recipe in
                    NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                        LazyHGridCell(recipe: recipe)
                    }
                }
            }
        }
    }
}

struct LazyHGridView_Previews: PreviewProvider {
    static var previews: some View {
        LazyHGridView()
            .environmentObject(FavoriteViewModel())
            .environmentObject(AddRecipeViewModel())
    }
}
