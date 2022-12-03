//
//  ExchangeView.swift
//  MiniExchange
//
//  Created by MAA on 3.12.2022.
//

import SwiftUI
import CoreData

struct ExchangeView: View {
    
    @State var show = false
    
    @State var selectCost1: Bool
    
    @ObservedObject var text = NumbersOnly()
    
    @State var exchangeShow = false
    @State var clickedButton: ClickedButton = .none
    
    @State var c1: String = ""
    @State var c2: String = ""
    
    @State var resultView = false
    
    @StateObject var viewModelx = ExchangeViewModel()
    
    // Verileri CoreData'dan çekmek için kullanılacak kod
    /*@Environment(\.managedObjectContext) var context
    @FetchRequest(entity: Coin.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Coin.baseCode, ascending: true)]) var results : FetchedResults<Coin>*/
    
    
    var body: some View {

        ZStack {
            if resultView {
                ResultView(cost1: c1, cost2: c2, costSym1: c1, costSym2: c2, resultShow: $resultView)
            } else {
                VStack {
                    HStack {
                        Button {
                            self.show.toggle()
                            self.selectCost1.toggle()
                        } label: {
                            CostButton(buttonCost: c1)
                        }
                        
                        Image(systemName: "repeat")
                            .foregroundColor(Color.emphasisColor)
                        
                        Button {
                            self.show.toggle()
                        } label: {
                            CostButton(buttonCost: c2)
                        }
                    }.padding()
                    Spacer()
                    TextField("", text: $text.value)
                        .keyboardType(.numberPad)
                        .multilineTextAlignment(.center)
                        .font(Font.system(size: 30).bold())
                        .font(.title)
                        .foregroundColor(Color.emphasisColor)
                        .padding()
                        .accessibility(identifier: "amountTextField")
                    ExDivider()
                    Text("Final Amount: \(viewModelx.costSymbol(costSym: c2)) \(text.value) ")
                    //Text("Final Amount: \(c2) \(viewModelx.conversion_result) ")
                        .foregroundColor(Color.textColor)
                        .padding()
                    Spacer()
                    Text("1 \(c1) = 0.60 \(c2)")
                        .padding(5)
                        .overlay(
                            Capsule()
                                .stroke(lineWidth: 1))
                        .foregroundColor(Color.textColor)
                    Button {
                        // İki değerde seçilemeden işlem yapılamaz
                        if c1 != "", c2 != ""{
                            exchangeShow.toggle()
                        }
                        //exchangeShow.toggle()
                        //viewModelx.fetchDatax(c1: c1, c2: c2, amo: 100)
                    
                    } label: {
                        GenericButton(buttonTitle: LocaleKeys.Button.exchange.rawValue)
                    }.accessibility(identifier: "exchangeTaskButton")
                    Spacer()
                    
                }.background(self.exchangeShow ? Color.black.opacity(0.5) : Color.white)
            }
            
            
            VStack {
                Spacer()
                if self.show {
                    VStack {
                        VStack {
                            HStack {
                                Button {
                                    self.show.toggle()
                                } label: {
                                    Image(systemName: "xmark").resizable()
                                        .frame(width: 25, height: 25)
                                        .foregroundColor(Color.emphasisColor)
                                }
                                Spacer()
                                Text("Select Currency")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.titleColor)
                                Spacer()
                            }
                            .padding()
                            Divider()
                            CostListView(cost1: $c1, cost2: $c2, selectCost1: $selectCost1, show: $show)
                        }.background(Color.white)
                            .cornerRadius(15)
                    }
                }
            }.padding()
            
            if exchangeShow {
                CustomAlertView(cost1: c1, cost1Sym: viewModelx.costSymbol(costSym: c1), cost2: c2, cost2Sym: viewModelx.costSymbol(costSym: c2), exchangeShow: $exchangeShow, clickedButton: $clickedButton, resultView: $resultView)
            }
            
            
        }.background(self.show ? Color.black.opacity(0.5) : Color.white)
            
    }
}

struct ExchangeView_Previews: PreviewProvider {
    static var previews: some View {
        ExchangeView(selectCost1: false, c1: "", c2: "")
    }
}
