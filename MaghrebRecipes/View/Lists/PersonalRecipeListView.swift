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
                   ExtractedListView()
                }else {
                    EmptyView(imageName: Image(systemName: "book.closed.circle.fill"), title: "Aucune recette créée").multilineTextAlignment(.center)
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
                    }).foregroundStyle(.green)
                    .sheet(isPresented: $addRecipesVM.isSheetOn) {
                        AddRecipeForm()
                    }
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    if !addRecipesVM.myRecipes.isEmpty {
                        EditButton()
                            .foregroundStyle(.green)
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

struct ExtractedListView: View {
    @EnvironmentObject var addRecipesVM: AddRecipeViewModel

    var body: some View {
        List {
            ForEach(addRecipesVM.myRecipes) { recipe in
                RowCellView(recipe: recipe)
            } .onDelete(perform: addRecipesVM.delet)
                .onMove(perform: addRecipesVM.move)
        }.listStyle(.plain)
    }
}
