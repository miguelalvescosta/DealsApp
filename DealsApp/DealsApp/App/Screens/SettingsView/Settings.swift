//
//  Settings.swift
//  DealsApp
//
//  Created by Miguel Costa on 29/03/2026.
//

import SwiftUI
import Combine

final class Settings: ObservableObject {
    enum Currency: String, CaseIterable, Identifiable {
        case eur = "€"
        case usd = "$"

        var id: String { rawValue }
        var code: String { self == .eur ? "EUR" : "USD" }
    }

    @Published var selectedCurrency: Currency = .eur
}
