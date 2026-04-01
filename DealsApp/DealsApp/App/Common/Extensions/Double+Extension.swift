//
//  Double+Extension.swift
//  DealsApp
//
//  Created by Miguel Costa on 29/03/2026.
//
import Foundation

extension Double {
    var fromCents: Double {
        self / 100
    }

    func formattedPrice(currency: Settings.Currency) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = currency.code
        formatter.currencySymbol = currency.rawValue
        return formatter.string(from: NSNumber(value: self)) ?? "\(self)"
    }
}
