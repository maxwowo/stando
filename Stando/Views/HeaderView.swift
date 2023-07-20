//
//  HeaderView.swift
//  Stando
//
//  Created by Max Wo on 20/7/2023.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        ZStack {
            Text("Stando")
                .font(.largeTitle)
                .bold()

            HStack {
                Spacer()
                
                Button(action: {
                    print("stand clicked")
                }, label: {
                    Image("gear")
                        .font(.title2)
                })
                .buttonStyle(.plain)
                .help("Settings")
            }
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
