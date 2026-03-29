//
//  APIError.swift
//  DealApp
//
//  Created by Miguel Costa on 28/03/2026.
//

import Foundation

struct APIError: Decodable, Error {
    let errorCode: HTTPStatusCode
    let error: String
    let errors: [String]
}

extension APIError: LocalizedError {
    var errorDescription: String? {
        NSLocalizedString("error.\(errorCode.value)", comment: "")
    }
}
