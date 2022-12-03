//
//  CoinModel.swift
//  MiniExchange
//
//  Created by MAA on 3.12.2022.
//

import Foundation

struct CoinModel: Codable {
    let baseCode: String
    let targetCode: String
    let conversionRate: Double
    let conversionResult: Double
    
    enum CodingKeys: String, CodingKey {
        case baseCode = "base_code"
        case targetCode = "target_code"
        case conversionRate = "conversion_rate"
        case conversionResult = "conversion_result"
    }
}
