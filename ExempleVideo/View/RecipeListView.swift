//
//  RecipeListView.swift
//  ExempleVideo
//
//  Created by Elliot Knight on 29/03/2022.
//

import SwiftUI

struct RecipeListView: View {
    
    @EnvironmentObject var recipeVM: RecipeViewModel
    var body: some View {
        NavigationView {
            List {
                ForEach(RecipeCategory.allCases, id: \.self) { section in
                    
                    Section(header: Text(section.rawValue)) {
                        
                        ForEach(recipes.filter({ $0.recipCategory == section })) { recipe in
                            
                                HStack {
                                    NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                                        RecipeImageView(recipe: recipe)
                                        VStack(alignment: .leading, spacing: 5) {
                                            Text(recipe.title)
                                                .font(.headline)
                                            Text(String(recipe.price) + "€")
                                            Text(recipe.description)
                                                .lineLimit(2)
                                                .foregroundColor(.secondary)
                                        }
                                    
                                }
                            }
                        }
                    }
                }
            }.searchable(text: $recipeVM.search)
            .navigationTitle("Recettes")
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(RecipeViewModel())
    }
}
