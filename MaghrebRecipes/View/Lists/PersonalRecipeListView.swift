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
                    ExtractedPersonalRecipesListView()
                }else {
                    ZStack {
                        VStack {
                            EmptyView(imageName: Image(systemName: "book.closed.circle.fill"), title: "Aucune recette créée")
                                .multilineTextAlignment(.center)
                            CreateRecipeButtonCell(buttonFont: .title)
                        }
                    }
                }
            }
            .navigationTitle("Mes recettes")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    if !addRecipesVM.myRecipes.isEmpty {
                        CreateRecipeButtonCell()
                    }
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    if !addRecipesVM.myRecipes.isEmpty {
                        EditButton()
                            .buttonPersonnalStyle(.headline)
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

struct ExtractedPersonalRecipesListView: View {
    @EnvironmentObject var addRecipesVM: AddRecipeViewModel
    var body: some View {
        List {
            ForEach(addRecipesVM.myRecipes) { recipe in
                ListRowCell(recipe: recipe)
            } .onDelete(perform: addRecipesVM.delet)
                .onMove(perform: addRecipesVM.move)
        }.listStyle(.plain)
    }
}
