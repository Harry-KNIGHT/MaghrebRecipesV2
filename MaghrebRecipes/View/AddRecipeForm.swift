//
//  AddRecipeForm.swift
//  MaghrebRecipes
//
//  Created by Elliot Knight on 08/04/2022.
//

import SwiftUI

struct AddRecipeForm: View {
    @EnvironmentObject var recipeVM: AddRecipeViewModel
    @FocusState var isFocused: Bool
    
    // we declare State variables for each component of our recipe
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var photo: String = ""
    @State private var ingredient: String = ""
    @State private var recipeCategory : RecipeCategory = .entry
    @State private var allIngredients = [String]()
    @State private var recipeDifficulty: RecipeDifficulty = .easy
    @State private var recipeAveragePrice: RecipeAveragePrice = .cheap
    @State private var recipeValueTimeCooking: String = ""
    @State private var recipeTimeToCook: TimeToCook = .minute
    @State private var isVegetarian: Bool = false
    
    var body: some View {
//        NavigationView {
        VStack {
            Form {
                Section(header: Text("Nom")) {
                    // State variables are binded here (with $), to change there values when value in sub views is updated
                    RecipeFormExtractedView(titleKey: "Tajine Zeitoune", recipeField: $title)
                        .focused($isFocused)
                }
                
                Section(header: Text("Type de recette")) {
                    RecipeTypePickerView(category: $recipeCategory)
                    Toggle("Végétarien", isOn: $isVegetarian)
                }
                
                Section(header: Text("Ingrédients")) {
                    if !allIngredients.isEmpty {
                        ForEach(allIngredients, id: \.self) { ingredient in
                            Text(ingredient)
                        }.onDelete(perform: deletIndgredient )
                    }
                    
                    TextField("350G de beurre", text: $ingredient)
                        .keyboardType(.alphabet)
                    Button(action: {
                        if !ingredient.isEmpty {
                            allIngredients.append(ingredient)
                            ingredient = ""
                        }
                    }, label: { Label("Ingrédient", systemImage: "plus.circle.fill")}).buttonPersonnalStyle(.headline, colorModifier: !ingredient.isEmpty ? .green : .secondary)
                }.focused($isFocused)
                
                Section(header: Text("Remplir les champs")) {
                    Button(action: {
                        title = "Tajine Poulet aux Olives"
                        description = "Tajine de poulet aux olives généreuses"
                        ingredient = "450G de poulet"
                        recipeValueTimeCooking = "30"
                        isVegetarian = true
                    }, label: {
                        Label("Remplir le formulaire", systemImage: "plus.circle")
                    })
                }
                
                Section("Temps de préparation") {
                    TextField("12", text: $recipeValueTimeCooking)
                    Picker("Durée", selection: $recipeTimeToCook) {
                        ForEach(TimeToCook.allCases, id: \.self) { time in
                            Text(String(time.rawValue))
                                .keyboardType(.decimalPad)
                        }
                    }.pickerStyle(.automatic)
                    
                    Picker("Difficulté de préparation", selection: $recipeDifficulty) {
                        ForEach(RecipeDifficulty.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                }
                
                Section("Prix") {
                    Picker("Prix moyen", selection: $recipeAveragePrice) {
                        ForEach(RecipeAveragePrice.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                }
        
                Section(header: Text("Description")) {
                    DescriptionView(description: $description)
                        .focused($isFocused)
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
            
            ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing) {
                AddRecipeFormButtonView(title: title, description: description, photo: photo, ingredient: ingredient, recipeCategory: recipeCategory, allIngredients: allIngredients, recipeDifficulty: recipeDifficulty, recipeAveragePrice: recipeAveragePrice, recipeValueTimeCooking: recipeValueTimeCooking, recipeTimeToCook: recipeTimeToCook, isVegetarian: isVegetarian)
                        }
                }
        }
        
        
      
        .navigationTitle("Créer une recette")
        .navigationBarTitleDisplayMode(.inline)
//    }
    }
    
    func deletIndgredient(at offsets: IndexSet) {
        self.allIngredients.remove(atOffsets: offsets)
    }
}

struct AddRecipeForm_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddRecipeForm()
                .environmentObject(AddRecipeViewModel())
        }
        NavigationView {
            AddRecipeForm()
                .preferredColorScheme(.dark)
                .environmentObject(AddRecipeViewModel())
        }
    }
}

struct RecipeFormExtractedView: View {
    var titleKey: String
    
    // we have a binding there, in order to propagate the change to the parent view (variable is defined as a State porperty wrapper in the parent view, and a Binding property wrapper in the child view)
    @Binding var recipeField: String
    
    var body: some View {
        TextField(titleKey, text: $recipeField)
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
        }
        .pickerStyle(.automatic)
    }
}

struct DescriptionView: View {
    // we have a binding there, in order to propagate the change to the parent view (variable is defined as a State porperty wrapper in the parent view, and a Binding property wrapper in the child view)
    @Binding var description : String
    
    var body: some View {
        TextEditor(text: $description)
    }
}
