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
            List {
                ForEach(RecipeCategory.allCases, id: \.self) { section in
                    
                    Section(header: Text(section.rawValue)) {
                        
                        ForEach(recipes.filter({ $0.recipCategory == section })) { recipe in
                            NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                                HStack(alignment: .top) {
                                    
                                    RecipeImageView(recipe: recipe)
                                    
                                    
                                    TitleDescriptionView(recipe: recipe)
                                    Spacer()
                                    if favoriteVM.favoritesRecipes.contains(recipe) {
                                        LikeButtonCell(recipe: recipe)
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .listStyle(.inset)
            .navigationTitle("Recettes")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: {
                        addRecipeVM.isSheetOn.toggle()
                    }, label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.title2)
                    }).sheet(isPresented: $addRecipeVM.isSheetOn) {
                        AddRecipeForm()
                    }
                    
                }
                
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button(action: {
                        favoriteVM.isSheetOn.toggle()
                    }, label: {
                        Image(systemName: "heart.circle.fill")
                            .font(.title2)
                    }).sheet(isPresented: $favoriteVM.isSheetOn) {
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

struct TitleDescriptionView: View {
    let recipe: RecipeModel
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(recipe.title)
                .font(.headline)
            
            Text(recipe.description)
                .lineLimit(3)
                .foregroundColor(.secondary)
        }
    }
}
