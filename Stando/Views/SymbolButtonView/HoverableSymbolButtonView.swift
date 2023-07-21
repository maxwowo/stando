//
//  HoverableSymbolButtonView.swift
//  Stando
//
//  Created by Max Wo on 19/7/2023.
//

import SwiftUI

struct HoverableSymbolButtonView: View {
    let imageName: String
    let action: () -> Void

    @State private var isHovered = false

    var body: some View {
        SymbolButtonView(
            imageName: imageName,
            backgroundColor: isHovered ? Color.primary.opacity(0.1) : Color.clear,
            foregroundColor: Color.primary,
            action: action
        )
        .onHover { hovering in
            self.isHovered = hovering
        }
    }
}

struct HoverableSymbolButtonView_Previews: PreviewProvider {
    static var previews: some View {
        HoverableSymbolButtonView(imageName: "figure.stand") {
            print("Button clicked")
        }
    }
}
