//
//  RecipeListView.swift
//  ExempleVideo
//
//  Created by Elliot Knight on 29/03/2022.
//

import SwiftUI

struct RecipeListView: View {
    
    @EnvironmentObject var addRecipeVM: AddRecipeViewModel
    @EnvironmentObject var favoriteVM: FavoriteViewModel
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                LazyHGridView()
                ExtractedMainListView()
            }
            .navigationTitle("Recettes")
            // Navigation Bar
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: {
                        addRecipeVM.isSheetOn.toggle()
                    }, label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.title2)
                    }).foregroundColor(Color.green)
                        .accessibility(label: Text("Go to your favorites recipes"))
                        .sheet(isPresented: $addRecipeVM.isSheetOn) {
                            AddRecipeForm()
                        }
                    
                }
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button(action: {
                        favoriteVM.isSheetOn.toggle()
                    }, label: {
                        Image(systemName: "heart.circle.fill")
                            .font(.title2)
                    }).foregroundColor(Color.green)
                        .sheet(isPresented: $favoriteVM.isSheetOn) {
                            FavoritesView()
                        }
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
    @EnvironmentObject var favoriteVM: FavoriteViewModel

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
                    LikeButtonCell(recipe: recipe)
                    
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
