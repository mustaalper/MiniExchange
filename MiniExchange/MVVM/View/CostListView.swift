//
//  CostListView.swift
//  MiniExchange
//
//  Created by MAA on 3.12.2022.
//

import SwiftUI

struct CostListView: View {
    
    var viewModel = CostListViewModel()
    
    @Binding var cost1: String
    @Binding var cost2: String
    
    @Binding var selectCost1: Bool
    @Binding var show: Bool
    
    var body: some View {
            ScrollView (.vertical, showsIndicators: false) {
                VStack {
                    ForEach(0..<viewModel.dataarray.count, id: \.self) { index in
                        ZStack(alignment: .trailing) {
                            HStack {
                                Text(viewModel.dataarray[index]["name"]!)
                                    .font(.headline)
                                    .foregroundColor(Color.textColor)
                                    .padding()
                                Spacer()
                                Button {
                                    if selectCost1 {
                                        cost1 = viewModel.dataarray[index]["name"]!
                                        selectCost1 = false
                                    } else {
                                        cost2 = viewModel.dataarray[index]["name"]!
                                    }
                                    show.toggle()
                                    
                                } label: {
                                    Image(systemName: "circle.fill")
                                        .foregroundColor(Color.textColor)
                                }
                            }
                        }
                    }
                }
                .padding()
            }.background(Color.white)
            .frame(width: UIScreen.main.bounds.width - 10, height: UIScreen.main.bounds.width / 2)
            .cornerRadius(8)
    }
}

struct CostListView_Previews: PreviewProvider {
    static var previews: some View {
        CostListView(cost1: .constant(""), cost2: .constant(""), selectCost1: .constant(false), show: .constant(false))
            .previewLayout(.sizeThatFits)
    }
}

