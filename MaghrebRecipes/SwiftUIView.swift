//
//  SwiftUIView.swift
//  ExempleVideo
//
//  Created by Elliot Knight on 26/03/2022.
//

import SwiftUI

struct SwiftUIView: View {
    @State private var users = ["User1", "USer2", "User3"]
    var body: some View {
        NavigationView {
            List{
                ForEach(users, id: \.self) {
                    Text($0)
                }.onDelete(perform: delet)
            }
            .toolbar {
                EditButton()
            }
            
        }
      
    }
    func delet(at offsets: IndexSet) {
        users.remove(atOffsets: offsets)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
