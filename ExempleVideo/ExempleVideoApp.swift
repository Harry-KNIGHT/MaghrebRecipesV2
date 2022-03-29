//
//  ExempleVideoApp.swift
//  ExempleVideo
//
//  Created by Elliot Knight on 26/03/2022.
//

import SwiftUI

@main
struct ExempleVideoApp: App {
    
    @StateObject var recipeViewModel = RecipeViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(RecipeViewModel())
        }
    }
}
