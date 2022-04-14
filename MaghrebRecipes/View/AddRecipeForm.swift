//
//  AddRecipeForm.swift
//  MaghrebRecipes
//
//  Created by Elliot Knight on 08/04/2022.
//

import SwiftUI

struct AddRecipeForm: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var recipeVM: AddRecipeViewModel
    @FocusState var isFocused: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section {
                        RecipeFormExtractedView(title: "Nom", titleKey: "Tajine Zeitoune", recipeField: $recipeVM.title)
                            .focused($isFocused)
                        
                        RecipeTypePickerView()
                        
                        RecipePricePickerView()
                        
                        DescriptionView()
                            .focused($isFocused)
                    }
                    
                    Section {
                        Button(action: {
                            if !recipeVM.title.isEmpty && recipeVM.description.count > 5 {
                                recipeVM.addRecipeButton()
                                presentationMode.wrappedValue.dismiss()
                                self.recipeVM.simpleSuccesHaptic()
                            }
                        }, label: {
                            Text("Ajouter la recette")
                                .foregroundColor(!recipeVM.title.isEmpty && recipeVM.description.count > 5 ? .blue : .secondary)
                        })
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .keyboard) {
                    HStack {
                        Spacer()
                        Button("OK") {
                            isFocused = false
                        }
                    }
                }
                ToolbarItem {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "chevron.down")
                    }).foregroundStyle(.green)
                }
            }
            .navigationTitle("Ajouter une recette")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct AddRecipeForm_Previews: PreviewProvider {
    static var previews: some View {
        AddRecipeForm()
            .environmentObject(AddRecipeViewModel())
        AddRecipeForm()
            .preferredColorScheme(.dark)
            .environmentObject(AddRecipeViewModel())
    }
}

struct RecipeFormExtractedView: View {
    var title: String
    var titleKey: String
    @Binding var recipeField: String
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
            TextField(titleKey, text: $recipeField)
            
        }
    }
}

struct RecipeTypePickerView: View {
    @EnvironmentObject var recipeVM: AddRecipeViewModel
    
    var body: some View {
        Picker("Type de recette", selection: $recipeVM.recipeCategory) {
            ForEach(RecipeCategory.allCases, id: \.self) {
                Text($0.rawValue)
            }
        }.pickerStyle(.automatic)
    }
}

struct DescriptionView: View {
    @EnvironmentObject var recipeVM: AddRecipeViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Description")
            TextEditor(text: $recipeVM.description)
        }
    }
}

struct RecipePricePickerView: View {
    @EnvironmentObject var recipeVM: AddRecipeViewModel
    
    var body: some View {
        Picker("Prix moyen", selection: $recipeVM.recipePrice) {
            ForEach(1...30, id: \.self) {
                Text(String($0) + "€")
            }
        }.pickerStyle(.automatic)
    }
}
