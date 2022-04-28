//
//  CreateRecipeButtonCell.swift
//  MaghrebRecipes
//
//  Created by Elliot Knight on 17/04/2022.
//

import SwiftUI

struct CreateRecipeButtonCell: View {
    @State private var isActive = false
    public var buttonFont: Font = .title3
    var body: some View {
        

        Button(action: {
            self.isActive = true
        }, label: {
            Label("Créer une recette", systemImage: "plus.circle.fill")
                .font(buttonFont)
        })
        .buttonPersonnalStyle()
        .sheet(isPresented: $isActive) {
            AddRecipeForm()
        }
    }
}

struct CreateRecipeButtonCell_Previews: PreviewProvider {
    static var previews: some View {
        CreateRecipeButtonCell()
    }
}
