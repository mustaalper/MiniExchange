//
//  NumbersOnly.swift
//  MiniExchange
//
//  Created by MAA on 3.12.2022.
//

import Foundation

class NumbersOnly: ObservableObject {
    @Published var value = "" {
        didSet {
            let filtered = value.filter { $0.isNumber }
            
            if value != filtered {
                value = filtered
            }
        }
    }
}
