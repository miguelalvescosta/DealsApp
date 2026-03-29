//
//  APIClient.swift
//  DealApp
//
//  Created by Miguel Costa on 28/03/2026.
//

import Foundation

final class APIClient: APIClientProtocol {
    private let environment: APIEnvironment
    private let urlSession: URLSession

    init(
        environment: APIEnvironment = .current(),
        urlSession: URLSession = .shared
    ) {
        self.environment = environment
        self.urlSession = urlSession
    }
}

extension APIClient {
    func dataTask<Response, Request>(
        with resource: Resource<Response, Request>
    ) async throws -> Response {
        let urlRequest = try URLRequest(
            request: resource.request,
            baseURL: environment.baseURL,
            additionalHeaders: environment.additionalHeaders
        )

        let (data, response) = try await urlSession.data(for: urlRequest)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }

        let statusCode = HTTPStatusCode(value: httpResponse.statusCode)

        guard statusCode.isSuccess else {
            if let apiError = try? JSONDecoder().decode(
                APIError.self, from: data
            ) {
                throw NetworkError.apiError(apiError)
            }

            throw NetworkError.requestFailed(statusCode, data)
        }

        do {
            return try resource.decode(data)
        } catch let decodingError as DecodingError {
            throw NetworkError.decodingFailed(decodingError, data)
        } catch {
            throw NetworkError.unknown(error)
        }
    }
}
