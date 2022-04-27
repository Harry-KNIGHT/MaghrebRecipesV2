//
//  RecipeDetailView.swift
//  ExempleVideo
//
//  Created by Elliot Knight on 29/03/2022.
//

import SwiftUI

struct RecipeDetailView: View {
    @EnvironmentObject var favoriteVM: FavoriteViewModel
    @EnvironmentObject var addRecipeVM: AddRecipeViewModel
    let recipe: RecipeModel
    var body: some View {
        VStack {
            ScrollView {
                Image(recipe.photo)
                    .resizable()
                    .frame(height: 200)
                    .scaledToFill()
                VStack(alignment: .leading) {
                    RecipeTitleCategoryDetailEctractedView(recipe: recipe)
                    
                    Divider()
                    
                    HStack(alignment: .center) {
                        MainInformationExtractedView(text: "\(recipe.valueTimeCooking.formatted()) \(recipe.timeToCook.rawValue.lowercased())", sfSymbol: "hourglass.circle.fill")
                        Spacer()
                        MainInformationExtractedView(text: recipe.recipeAveragePrice.rawValue, sfSymbol: "eurosign.circle.fill")
                        
                        Spacer()
                        MainInformationExtractedView(text: recipe.recipeDifficulty.rawValue, sfSymbol: "flag.circle.fill")
                        
                    }
                    Divider()
                    if !recipe.ingredients.isEmpty {
                    HStack(alignment: .top) {
                        Text("Ingrédients:")
                            .font(.headline)
                        VStack(alignment: .leading, spacing: 5) {
                            ForEach(recipe.ingredients, id: \.self) { ingredient in
                                Text("- \(ingredient)")
                            }
                        }
                    }
                        Divider()
                    }
                    
                  
                    RecipeDescriptionDetailExtractedView(recipe: recipe)
                    
                }.padding(.horizontal)
            }
        }
        .modifier(Navigation(recipe: recipe))
    }
}

struct Navigation: ViewModifier {
    let recipe: RecipeModel
    @EnvironmentObject var favoriteVM: FavoriteViewModel
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItemGroup(placement: ToolbarItemPlacement.navigationBarTrailing) {
                    LikeButtonDetailViewCell(recipe: recipe)
                    Button(action: {
                        // Share recipe later
                    }, label: {
                        Label("Share recipe that you like", systemImage: "square.and.arrow.up")
                    }).buttonPersonnalStyle(.title3)
                }
            }
            .navigationTitle(recipe.title)
            .navigationBarTitleDisplayMode(.inline)
        
    }
    
    func simpleSucces() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                RecipeDetailView(recipe:  RecipeModel(title: "Maakouda", photo: "maakouda", description: "La maaqouda, maqouda ou maakouda est un mets préparé et consommé en Algérie, au Maroc et en Tunisie, essentiellement pendant le mois de ramadan. Il s'agit d'une sorte de beignet de pommes de terre qui peut aussi se décliner avec du thon, de la viande hachée ou du fromage", ingredients: ["4 oeufs", "Citron"], recipCategory: .entry, recipeDifficulty: .hard, recipeAveragePrice: .expensive, valueTimeCooking: 25.5, timeToCook: .minute, vegetarianRecipe: true))
                    .environmentObject(FavoriteViewModel())
                    .environmentObject(AddRecipeViewModel())
            }
            NavigationView {
                RecipeDetailView(recipe:  RecipeModel(title: "Maakouda", photo: "maakouda", description: "La maaqouda, maqouda ou maakouda est un mets préparé et consommé en Algérie, au Maroc et en Tunisie, essentiellement pendant le mois de ramadan. Il s'agit d'une sorte de beignet de pommes de terre qui peut aussi se décliner avec du thon, de la viande hachée ou du fromage", ingredients: ["Boeuf", "4 oeufs"], recipCategory: .entry, recipeDifficulty: .medium, recipeAveragePrice: .cheap, valueTimeCooking: 25, timeToCook: .minute, vegetarianRecipe: false))
                    .environmentObject(FavoriteViewModel())
                    .environmentObject(AddRecipeViewModel())
            }
            .preferredColorScheme(.dark)
        }
    }
}


struct RecipeTitleCategoryDetailEctractedView: View {
    let recipe: RecipeModel
    var body: some View {
        HStack {
            Text(recipe.title)
                .foregroundStyle(.primary)
                .font(.title2.bold())
            Spacer()
            Text(recipe.recipCategory.rawValue)
                .foregroundColor(.secondary)
                .font(.headline)
        }
    }
}

struct RecipeDescriptionDetailExtractedView: View {
    let recipe: RecipeModel
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Description:")
                .font(.headline)
            Text(recipe.description)
                .multilineTextAlignment(.leading)
        }
    }
}

struct  MainInformationExtractedView: View {
    
    let text: String
    let sfSymbol: String
    var body: some View {
        VStack(alignment: .center, spacing: 6) {
            
            Image(systemName: sfSymbol)
                .font(.title2)
                .foregroundColor(.green)
            Text(text)
                .font(.headline)
        }
    }
}
