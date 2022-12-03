//
//  GenericButton.swift
//  MiniExchange
//
//  Created by MAA on 3.12.2022.
//

import SwiftUI

struct GenericButton: View {
    var buttonTitle: String
    var body: some View {
        HStack {
            Spacer()
            Text(buttonTitle.locale())
                .foregroundColor(Color.white)
                .font(.title)
                .padding()
            Spacer()
        }
        .buttonBorderShape(.roundedRectangle)
        .controlSize(.large)
        .background(Color.emphasisColor)
        .cornerRadius(10)
        .padding()
    }
}

struct GenericButton_Previews: PreviewProvider {
    static var previews: some View {
        GenericButton(buttonTitle: "Exchange")
    }
}
