//
//  APIEnvironment.swift
//  DealApp
//
//  Created by Miguel Costa on 28/03/2026.
//
import Foundation

struct APIEnvironment {
    let baseURL: URL
    let additionalHeaders: [HTTPHeaderKey: String]

    private init(
        basePath: String,
        additionalHeaders: [HTTPHeaderKey: String] = [:]
    ) {
        self.baseURL = URL(string: basePath)!
        self.additionalHeaders = additionalHeaders
    }
}

// MARK: - Current environment
extension APIEnvironment {
    static func current() -> APIEnvironment {
        APIEnvironment(basePath: AppConfiguration.apiBaseURL)
    }
}
