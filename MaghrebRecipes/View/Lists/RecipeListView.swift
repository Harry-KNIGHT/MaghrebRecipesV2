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

struct ExtractedMainListView: View {
    var body: some View {
        List {
            ForEach(RecipeCategory.allCases, id: \.self) { section in
                Section(header: Text(section.rawValue)) {
                    ForEach(recipes.filter({ $0.recipCategory == section })) { recipe in
                        ListRowCell(recipe: recipe)
                    }
                }
                
            }
        }
        .listStyle(.inset)
        .frame(height: 1000)
    }
}


