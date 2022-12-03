//
//  CostButton.swift
//  MiniExchange
//
//  Created by MAA on 3.12.2022.
//

import SwiftUI

struct CostButton: View {
    var buttonCost: String
    var body: some View {
        HStack {
            Text(buttonCost)
            Image(systemName: "chevron.down")
        }.foregroundColor(Color.titleColor)
        .padding()
            .background(
                Capsule()
                    .strokeBorder(Color.textColor)
                    .background(Color.textColor)
                    .clipped())
            .clipShape(Capsule())
    }
}

struct CostButton_Previews: PreviewProvider {
    static var previews: some View {
        CostButton(buttonCost: "USD")
    }
}
