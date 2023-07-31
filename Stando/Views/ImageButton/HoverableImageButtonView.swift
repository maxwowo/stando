//
//  HoverableSymbolButtonView.swift
//  Stando
//
//  Created by Max Wo on 19/7/2023.
//

import SwiftUI

struct HoverableImageButtonView: View {
    let imageName: String
    let action: () -> Void

    @State private var isHovered = false

    var body: some View {
        ImageButtonView(
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

struct HoverableImageButtonView_Previews: PreviewProvider {
    static var previews: some View {
        HoverableImageButtonView(imageName: "figure.stand") {
            print("Button clicked")
        }
    }
}
