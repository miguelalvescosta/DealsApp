//
//  SettingsView.swift
//  DealsApp
//
//  Created by Miguel Costa on 29/03/2026.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var settings: Settings

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Currency")) {
                    Picker("Currency", selection: $settings.selectedCurrency) {
                        ForEach(Settings.Currency.allCases) { currency in
                            Text("\(currency.rawValue) \(currency.code)").tag(currency)
                        }
                    }
                    .pickerStyle(.segmented)
                }
            }
            .navigationTitle("Settings")
        }
    }
}
