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
                Section(header: Text("currency_title".localized)) {
                    Picker("currency_title".localized, selection: $settings.selectedCurrency) {
                        ForEach(Settings.Currency.allCases) { currency in
                            Text("\(currency.rawValue) \(currency.code)").tag(currency)
                        }
                    }
                    .pickerStyle(.segmented)
                }
            }
            .navigationTitle("settings_screen_title".localized)
        }
    }
}
