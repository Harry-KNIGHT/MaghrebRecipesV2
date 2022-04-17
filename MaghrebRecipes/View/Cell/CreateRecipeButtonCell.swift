//
//  CreateRecipeButtonCell.swift
//  MaghrebRecipes
//
//  Created by Elliot Knight on 17/04/2022.
//

import SwiftUI

struct CreateRecipeButtonCell: View {
    @State private var isShowingSheet: Bool = false
    var body: some View {
        Button(action: {
            isShowingSheet = true
        }, label: {
            Label("Créer une recette", systemImage: "plus.circle.fill")
        })
        .buttonPersonnalStyle()
        .sheet(isPresented: $isShowingSheet) {
            AddRecipeForm()
        }
    }
}

struct CreateRecipeButtonCell_Previews: PreviewProvider {
    static var previews: some View {
        CreateRecipeButtonCell()
    }
}


struct CreateRecipeButtonCellExtractedView: View {
    @State private var isShowingSheet: Bool = false
    var body: some View {
        Button(action: {
            isShowingSheet = true
        }, label: {
            Label("Créer une recette", systemImage: "plus.circle.fill")
        })
        .buttonPersonnalStyle(.title)
        .sheet(isPresented: $isShowingSheet) {
            AddRecipeForm()
        }
    }
}
