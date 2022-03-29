//
//  ListView.swift
//  ExempleVideo
//
//  Created by Elliot Knight on 26/03/2022.
//

import SwiftUI

struct ListView: View {
    @State private var choice = "Plat"
    
    var body: some View {
        NavigationView {
//            VStack {
//                Picker("Faire votre choix", selection: $choice) {
//                    ForEach(RecipeCategory) {
//                        Text($0)
//                    }
//                }
//                .padding()
//                .pickerStyle(.segmented)
                
                List {
              
                        ForEach(recipes) { recipe in
            
                            NavigationLink(destination: ItemDetailView(recipe: recipe)) {
                            HStack {
                           ImageCellView(recipe: recipe)
                                VStack(alignment: .leading, spacing: 2) {
                                Text(recipe.title)
                                        .font(.title2.bold())
                                Text(String(recipe.wieght) + "G")
                                        .font(.body)
                            
                                Text(String(recipe.price) + "€")
                                        .font(.body)

                                Text(recipe.description)
                                        .font(.caption)
                                        .foregroundStyle(.secondary)
                                        .lineLimit(2)
                                }
                                
                            }
                        }
                    }
                       
                }.listStyle(.plain)
                .navigationTitle("Les recettes")
            }
        }
   // } Picker
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
