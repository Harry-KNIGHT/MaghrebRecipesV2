//
//  CodeSnippetView.swift
//  MaghrebRecipes
//
//  Created by Elliot Knight on 13/04/2022.
//

import SwiftUI

struct CodeSnippetView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                LazyHGridView()
                List {
                    ForEach(0...100, id: \.self) {
                        Text(String($0))
                    }
                }.frame(height: 20)
            }
            .navigationTitle("Eho")
        }
    }
}

struct CodeSnippetView_Previews: PreviewProvider {
    static var previews: some View {
        CodeSnippetView()
    }
}
