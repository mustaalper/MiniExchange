//
//  LocaleKeys.swift
//  MiniExchange
//
//  Created by MAA on 3.12.2022.
//

import Foundation
import SwiftUI

struct LocaleKeys {
    enum Button: String {
        case exchange = "exchange"
        case backToExchange = "backToExchange"
    }
    
    enum AlertButton: String {
        case cancel = "cancel"
        case confirm = "confirm"
    }
    
    enum Title: String {
        case confirmOperation = "confirmOperation"
        case success = "success"
    }
}

extension String {
    /// It localize any string from Localizable.string
    /// - Returns: Localized value
    func locale() -> LocalizedStringKey {
        return LocalizedStringKey(self)
    }
}
