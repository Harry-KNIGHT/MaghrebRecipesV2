//
//  PaimentView.swift
//  ExempleVideo
//
//  Created by Elliot Knight on 29/03/2022.
//

import SwiftUI

struct PaimentView: View {
    @EnvironmentObject var recipeVM: RecipeViewModel
    var body: some View {
        Form {
            Section {
                Picker("Moyen de paiement", selection: $recipeVM.selection) {
                    ForEach(recipeVM.paiments, id: \.self) {
                        Text($0)
                    }
                }.pickerStyle(.segmented)
            }
            Section {
                Toggle("Recevoir la facture par mail", isOn: $recipeVM.isOn.animation())
                
                if recipeVM.isOn {
                    TextField("eliott.knight@icloud.com", text: $recipeVM.textFieldMail)
                }
            }
            
            Section(header: Text(String(recipeVM.total) + "€").font(.headline)) {
                Button("Payer") {
                    
                }
            }
        }
        .navigationTitle("Paiement")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct PaimentView_Previews: PreviewProvider {
    static var previews: some View {
        PaimentView()
            .environmentObject(RecipeViewModel())
    }
}
