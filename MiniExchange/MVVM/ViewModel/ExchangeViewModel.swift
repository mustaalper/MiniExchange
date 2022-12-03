//
//  ExchangeViewModel.swift
//  MiniExchange
//
//  Created by MAA on 3.12.2022.
//

import Foundation
import CoreData

class ExchangeViewModel: ObservableObject {
    @Published var baseCode: String = ""
    @Published var targetCode: String = ""
    @Published var conversionRate: Double = 0.0
    @Published var conversionResult: Double = 0.0
    
    @Published var coins : [CoinModel] = []
    
    func saveData(context: NSManagedObjectContext) {
        
        coins.forEach { (data) in
            let entity  = Coin(context: context)
            
            entity.baseCode = data.baseCode
            entity.targetCode = data.targetCode
            entity.conversionRate = data.conversionRate
            entity.conversionResult = data.conversionResult
            
            do {
                try context.save()
                print("success")
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func fetchDatax(c1: String, c2: String, amo: Int) {
        guard let url = URL(string: "https://v6.exchangerate-api.com/v6/740b1dacc33cba2f0a84873b/pair/\(c1)/\(c2)/\(amo)") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let model = try JSONDecoder().decode(CoinModel.self, from: data)
                DispatchQueue.main.async {
                    self.baseCode = model.baseCode
                    self.targetCode = model.targetCode
                    self.conversionRate = model.conversionRate
                    self.conversionResult = model.conversionResult
                }
            } catch {
                print("failed")
            }
        }
        task.resume()
    }
    
    func costSymbol(costSym: String) -> String {
        switch costSym {
        case "USD":
            return "$"
        case "EUR":
            return "€"
        case "AUD":
            return "A$"
        case "TRY":
            return "₺"
        case "CAD":
            return "C$"
        case "GEL":
            return "ლ"
        default:
            return ""
        }
    }
}
