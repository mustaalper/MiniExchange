//
//  ResultView.swift
//  MiniExchange
//
//  Created by MAA on 3.12.2022.
//

import SwiftUI

struct ResultView: View {
    
    var cost1: String
    var cost2: String
    var costSym1: String
    var costSym2: String
    
    @Binding var resultShow: Bool
    
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "checkmark.circle.fill")
                .resizable()
                .frame(width: 50, height: 50)
                .foregroundColor(Color.tickColor)
            Text(LocaleKeys.Title.success.rawValue.locale()).bold()
            Text("\(cost1) \(costSym1) = \(cost2) \(costSym2)")
                .foregroundColor(Color.textColor)
            Spacer()
            Button {
                resultShow.toggle()
            } label: {
                GenericButton(buttonTitle: LocaleKeys.Button.backToExchange.rawValue)
            }
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(cost1: "USD", cost2: "EUR", costSym1: "$", costSym2: "£", resultShow: .constant(false))
    }
}

