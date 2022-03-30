//
//  EmptyView.swift
//  MaghrebRecipes
//
//  Created by Elliot Knight on 30/03/2022.
//

import SwiftUI

struct EmptyView: View {
    var imageName: String
    var title: String
    var body: some View {
        VStack {
            Image(systemName: imageName)
                .font(.system(size: 50))
            Text(title)
                .font(.title)
        }.foregroundStyle(.secondary)
    }
}

struct EmptyView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView(imageName: "cart.fill", title: "Votre panier est vide")
    }
}
