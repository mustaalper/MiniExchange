//
//  ExDivider.swift
//  MiniExchange
//
//  Created by MAA on 3.12.2022.
//

import SwiftUI

struct ExDivider: View {
    let color: Color = .gray
    let height: CGFloat = 1
    let width: CGFloat = UIScreen.main.bounds.width / 5
        var body: some View {
            Rectangle()
                .fill(color)
                .frame(width: width, height: height)
                .edgesIgnoringSafeArea(.horizontal)
        }
}

/*struct ExDivider_Previews: PreviewProvider {
    static var previews: some View {
        ExDivider()
    }
}*/

