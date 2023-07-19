//
//  SymbolButtonView.swift
//  Stando
//
//  Created by Max Wo on 19/7/2023.
//

import SwiftUI

struct SymbolButtonView: View {
    let imageName: String
    let backgroundColor: Color
    let foregroundColor: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(imageName)
                .font(.title2)
                .frame(width: 40, height: 40)
                .background(backgroundColor)
                .foregroundColor(foregroundColor)
                .clipShape(Circle())
        }
        .buttonStyle(.plain)
    }
}

struct SymbolButtonView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            SymbolButtonView(imageName: "figure.stand", backgroundColor: Color.accentColor, foregroundColor: Color.primary) {
                print("Button clicked")
            }
            SymbolButtonView(imageName: "figure.stand", backgroundColor: Color.indigo, foregroundColor: Color.primary) {
                print("Button clicked")
            }
        }
    }
}
