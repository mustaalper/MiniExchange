//
//  CostListViewModel.swift
//  MiniExchange
//
//  Created by MAA on 3.12.2022.
//

import Foundation

final class CostListViewModel {
    let dataarray: [[String: String]] = [
        ["id":"1", "name":"USD"],
        ["id":"2", "name":"EUR"],
        ["id":"3", "name":"AUD"],
        ["id":"4", "name":"TRY"],
        ["id":"5", "name":"CAD"],
        ["id":"6", "name":"GEL"],
    ]
    
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
