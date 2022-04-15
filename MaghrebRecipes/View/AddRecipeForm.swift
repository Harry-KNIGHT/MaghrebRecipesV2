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
    
    // we declare State variables for each component of our recipe
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var price: String = ""
    @State private var recipeCategory : RecipeCategory = .entry
    
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section {
                        
                        // State variables are binded here (with $), to change there values when value in sub views is updated
                        RecipeFormExtractedView(title: "Nom", titleKey: "Tajine Zeitoune", recipeField: $title)
                            .focused($isFocused)
                        RecipePriceExtractedView(price: $price)
                        DescriptionView(description: $description)
                            .focused($isFocused)
                        RecipeTypePickerView(category: $recipeCategory)
                    }
                    
                    Section {
                        Button(action: {
                            if !title.isEmpty && description.count > 5 {
                                
                                // addRecipeButton has now parameters, all info needed to create a recipe (View model has been modified too
                                recipeVM.addRecipeButton(title: title, price: price, description: description, category: recipeCategory)
                                presentationMode.wrappedValue.dismiss()
                                self.recipeVM.simpleSuccesHaptic()
                            }
                        }, label: {
                            Text("Ajouter la recette")
                                .foregroundColor(!title.isEmpty && description.count > 5 ? .blue : .secondary)
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
    
    // we have a binding there, in order to propagate the change to the parent view (variable is defined as a State porperty wrapper in the parent view, and a Binding property wrapper in the child view)
    @Binding var recipeField: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
            TextField(titleKey, text: $recipeField)
            
        }
    }
}

struct RecipeTypePickerView: View {
   
    // we have a binding there, in order to propagate the change to the parent view (variable is defined as a State porperty wrapper in the parent view, and a Binding property wrapper in the child view)
    @Binding var category : RecipeCategory
    
    var body: some View {
        Picker("Type de recette", selection: $category) {
            ForEach(RecipeCategory.allCases, id: \.self) {
                Text($0.rawValue)
            }
        }.pickerStyle(.automatic)
    }
}

struct DescriptionView: View {
    
    // we have a binding there, in order to propagate the change to the parent view (variable is defined as a State porperty wrapper in the parent view, and a Binding property wrapper in the child view)
    @Binding var description : String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Description")
            TextEditor(text: $description)
        }
    }
}

struct  RecipePriceExtractedView: View {
    
    // we have a binding there, in order to propagate the change to the parent view (variable is defined as a State porperty wrapper in the parent view, and a Binding property wrapper in the child view)
    @Binding var price : String

    var body: some View {
        VStack(alignment: .leading) {
            Text("Prix moyen")
            TextField("13.5€", text: $price)
                .keyboardType(.decimalPad)
        }
    }
}
