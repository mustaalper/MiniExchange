//
//  HomeView.swift
//  MiniExchange
//
//  Created by MAA on 3.12.2022.
//

import SwiftUI

struct HomeView: View {
    
    @State var show = false
    var body: some View {
        NavigationView {
            NavigationLink {
                ExchangeView(selectCost1: false, c1: "", c2: "")
            } label: {
                Text("Exchange")
            }.navigationTitle("Exchange")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
