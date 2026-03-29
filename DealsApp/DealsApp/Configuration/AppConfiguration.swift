//
//  AppConfiguration.swift
//  DealApp
//
//  Created by Miguel Costa on 28/03/2026.
//

import Foundation

extension AppConfiguration {
    enum Keys: String {
        case baseURL = "API_BASE_URL"
    }
}

struct AppConfiguration {
    static var apiBaseURL: String {
        stringBy(.baseURL).replacingOccurrences(of: "\\", with: "")
    }
}

private extension AppConfiguration {
    static func stringBy(_ key: Keys) -> String {
        guard let dict = Bundle.main.infoDictionary
        else { fatalError("Plist file not found" ) }

        guard let value = dict[key.rawValue] as? String
        else { fatalError("Key `\(key.rawValue)` not set in plist") }

        return value
    }
}
