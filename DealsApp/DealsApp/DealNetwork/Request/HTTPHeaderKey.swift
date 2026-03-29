//
//  HTTPHeaderKey.swift
//  DealsApp
//
//  Created by Miguel Costa on 28/03/2026.
//

@MainActor
struct HTTPHeaderKey: ExpressibleByStringLiteral, Hashable {
    let rawValue: String

    init(stringLiteral value: String) { rawValue = value }
}

extension HTTPHeaderKey {
    static let contentType = HTTPHeaderKey("Content-Type")
    static let accept = HTTPHeaderKey("Accept")
    static let authorization = HTTPHeaderKey("Authorization")
    static let userAgent = HTTPHeaderKey("User-Agent")
}
