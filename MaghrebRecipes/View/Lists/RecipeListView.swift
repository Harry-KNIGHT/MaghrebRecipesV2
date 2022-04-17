//
//  RecipeListView.swift
//  ExempleVideo
//
//  Created by Elliot Knight on 29/03/2022.
//

import SwiftUI

struct RecipeListView: View {
    
    @ObservedObject var addRecipeVM = AddRecipeViewModel.init()
    @ObservedObject var favoriteVM = FavoriteViewModel.init()
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                LazyHGridView()
                ExtractedMainListView()
            }
            .navigationTitle("Recettes")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    CreateRecipeButtonCell()
                }
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    ShowLikedSheetButtonExtractedView()
                }
            }
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RecipeListView()
                .environmentObject(AddRecipeViewModel())
                .environmentObject(FavoriteViewModel())
            RecipeListView()
                .preferredColorScheme(.dark)
                .environmentObject(AddRecipeViewModel())
                .environmentObject(FavoriteViewModel())
        }
    }
}

struct RowCellView: View {
    let recipe: RecipeModel
    @ObservedObject var favoriteVM = FavoriteViewModel.init()
    
    var body: some View {
        HStack(alignment: .top) {
            RecipeImageView(recipe: recipe)
            VStack(alignment: .leading, spacing: 10) {
                Text(recipe.title)
                    .font(.headline)
                Text(recipe.description)
                    .lineLimit(2)
                    .foregroundColor(.secondary)
            }
            Spacer()
            if favoriteVM.favoritesRecipes.contains(recipe) {
                LikeButtonDetailViewCell(recipe: recipe)
                
            }
        }
    }
}

struct ExtractedMainListView: View {
    var body: some View {
        List {
            ForEach(RecipeCategory.allCases, id: \.self) { section in
                Section(header: Text(section.rawValue)) {
                    ForEach(recipes.filter({ $0.recipCategory == section })) { recipe in
                        NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                            RowCellView(recipe: recipe)
                        }
                    }
                }
            }
        }
        .listStyle(.plain)
        .frame(height: 1000)
    }
}


