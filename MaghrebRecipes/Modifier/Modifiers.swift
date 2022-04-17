//
//  Modifiers.swift
//  MaghrebRecipes
//
//  Created by Elliot Knight on 17/04/2022.
//

import SwiftUI


// Buttons Style, they are following accessibilty rules with bordered style.
struct ButtonModifier: ViewModifier {
    var fontModifier: Font
    var colorModifier: Color
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .font(fontModifier)
            .tint(colorModifier)
            .foregroundColor(.green)
    }
}


extension View {
    func buttonPersonnalStyle(_ fontModifier: Font = .title2, colorModifier: Color = .green) -> some View {
        modifier(ButtonModifier(fontModifier: fontModifier, colorModifier: colorModifier))
    }
}
