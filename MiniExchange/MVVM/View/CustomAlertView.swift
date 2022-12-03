//
//  CustomAlertView.swift
//  MiniExchange
//
//  Created by MAA on 3.12.2022.
//

import SwiftUI

enum ClickedButton {
    case cancel
    case confirm
    case none
}

struct CustomAlertView: View {
    @State var cost1: String
    @State var cost1Sym: String
    
    @State var cost2: String
    @State var cost2Sym: String
    
    @Binding var exchangeShow: Bool
    @Binding var clickedButton: ClickedButton
    
    @Binding var resultView: Bool
    
    var body: some View {
        
        // Test kullanabilmek için
        /*NavigationView {
            VStack {
                Text(LocaleKeys.Title.confirmOperation.rawValue.locale()).bold()
                    .padding()
                Spacer()
                Text("Are you about to get \(cost2Sym)\(cost2) for \(cost1Sym)\(cost1) ? Do you approve the transaction?")
                    .multilineTextAlignment(.center)
                Spacer()
                Divider()
                HStack {
                    Button {
                        exchangeShow.toggle()
                        clickedButton = .cancel
                    } label: {
                        Text(LocaleKeys.AlertButton.cancel.rawValue.locale()).bold()
                    }.frame(width: UIScreen.main.bounds.width / 2 - 25, height: 40)
                    .foregroundColor(Color.textColor)
                    Divider()
                    Button {
                        exchangeShow.toggle()
                        resultView.toggle()
                        clickedButton = .confirm
                    } label: {
                        Text(LocaleKeys.AlertButton.confirm.rawValue.locale()).bold()
                    }.frame(width: UIScreen.main.bounds.width / 2 - 25, height: 40)
                        .foregroundColor(Color.emphasisColor)
                }
            }.frame(width: UIScreen.main.bounds.width - 50, height: 200)
                .background(Color.white)
                .cornerRadius(12)
                .clipped()
                .padding()
                .navigationTitle("Warning View")
        }*/
        
        
        VStack {
            Text(LocaleKeys.Title.confirmOperation.rawValue.locale()).bold()
                .padding()
            Spacer()
            Text("Are you about to get \(cost2Sym)\(cost2) for \(cost1Sym)\(cost1) ? Do you approve the transaction?")
                .multilineTextAlignment(.center)
            Spacer()
            Divider()
            HStack {
                Button {
                    exchangeShow.toggle()
                    clickedButton = .cancel
                } label: {
                    Text(LocaleKeys.AlertButton.cancel.rawValue.locale()).bold()
                }.frame(width: UIScreen.main.bounds.width / 2 - 25, height: 40)
                    .foregroundColor(Color.textColor)
                Divider()
                Button {
                    exchangeShow.toggle()
                    resultView.toggle()
                    clickedButton = .confirm
                } label: {
                    Text(LocaleKeys.AlertButton.confirm.rawValue.locale()).bold()
                }.frame(width: UIScreen.main.bounds.width / 2 - 25, height: 40)
                    .foregroundColor(Color.emphasisColor)
            }
        }.frame(width: UIScreen.main.bounds.width - 50, height: 200)
            .background(Color.white)
            .cornerRadius(12)
            .clipped()
            .padding()
        }
}

struct CustomAlertView_Previews: PreviewProvider {
    static var previews: some View {
        CustomAlertView(cost1: "102", cost1Sym: "$", cost2: "120", cost2Sym: "£", exchangeShow: .constant(false), clickedButton: .constant(.none), resultView: .constant(false))
    }
}

