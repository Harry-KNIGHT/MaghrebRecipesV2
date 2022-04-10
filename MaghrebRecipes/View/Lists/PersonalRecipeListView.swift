//
//  PersonalRecipeListView.swift
//  MaghrebRecipes
//
//  Created by Elliot Knight on 08/04/2022.
//

import SwiftUI

struct PersonalRecipeListView: View {
    @EnvironmentObject var addRecipesVM: AddRecipeViewModel
    var body: some View {
        NavigationView {
            VStack {
                if !addRecipesVM.myRecipes.isEmpty {
                    List {
                        ForEach(addRecipesVM.myRecipes) { recipe in
                            NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                                HStack(alignment: .center) {
                                    RecipeImageView(recipe: recipe)
                                    VStack(alignment: .leading, spacing: 10) {
                                        Text(recipe.title)
                                            .font(.headline)
                                        Text(String(recipe.price) + "€")
                                        Text(recipe.description)
                                            .foregroundColor(.secondary)
                                            .lineLimit(2)
                                    }
                                }
                            }
                        }
                        .onDelete(perform: addRecipesVM.delet)
                        .onMove(perform: addRecipesVM.move)
                    }
                }else {
                    EmptyView(imageName: Image(systemName: "exclamationmark.circle.fill"), title: "Aucune recette créée").multilineTextAlignment(.center)
                        .padding()
                }
            }
            .navigationTitle("Mes recettes")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        addRecipesVM.isSheetOn.toggle()
                    }, label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.title2)
                    }).sheet(isPresented: $addRecipesVM.isSheetOn) {
                        AddRecipeForm()
                    }
                }
            }
        }
    }
}

struct PersonalRecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PersonalRecipeListView()
                .environmentObject(AddRecipeViewModel())
            PersonalRecipeListView()
                .colorScheme(.dark)
                .environmentObject(AddRecipeViewModel())
        }
    }
}
