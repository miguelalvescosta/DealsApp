//
//  NetworkError.swift
//  DealApp
//
//  Created by Miguel Costa on 28/03/2026.
//
import Foundation

enum NetworkError: Error {
    case invalidURL(String)
    case invalidResponse

    case requestFailed(HTTPStatusCode, Data?)
    case decodingFailed(DecodingError, Data)
    case encodingFailed(EncodingError)

    case apiError(APIError)
    case unknown(Error)
}
