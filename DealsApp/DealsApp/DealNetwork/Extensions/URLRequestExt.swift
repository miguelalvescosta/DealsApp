//
//  URLRequestExt.swift
//  DealApp
//
//  Created by Miguel Costa on 28/03/2026.
//

import Foundation

extension URLRequest {
    init(
        request: some Requestable,
        baseURL: URL,
        additionalHeaders: [HTTPHeaderKey: String]
    ) throws {
        guard let fullURL = request.fullURL(baseURL: baseURL) else {
            throw NetworkError.invalidURL(request.path)
        }

        self.init(url: fullURL)
        self.httpMethod = request.method.rawValue

        // Adding headers
        let allHeaders = additionalHeaders.merging(
            request.headers,
            uniquingKeysWith: { (_, new) in new }
        )

        for (key, value) in allHeaders {
            self.addValue(value, forHTTPHeaderField: key.rawValue)
        }

        if let body = request.body {
            do {
                self.httpBody = try JSONEncoder().encode(body)
            } catch let encodingError as EncodingError {
                throw NetworkError.encodingFailed(encodingError)
            } catch {
                throw NetworkError.unknown(error)
            }
        }
    }
}
