//
//  EmptyView.swift
//  MaghrebRecipes
//
//  Created by Elliot Knight on 30/03/2022.
//

import SwiftUI

struct EmptyView: View {
    var imageName: Image
    var title: String
    var body: some View {
        VStack {
            imageName
                .font(.system(size: 50))
            Text(title)
                .font(.title)
        }.foregroundStyle(.secondary)
    }
}

struct EmptyView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            EmptyView(imageName: Image(systemName: "cart.fill"), title: "Votre panier est vide")
            EmptyView(imageName: Image(systemName: "cart.fill"), title: "Votre panier est vide")
                .preferredColorScheme(.dark)
        }
    }
}
