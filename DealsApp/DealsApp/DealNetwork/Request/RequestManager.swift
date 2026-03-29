//
//  RequestManager.swift
//  DealApp
//
//  Created by Miguel Costa on 28/03/2026.
//

protocol RequestManagerProtocol {
    var apiClient: APIClientProtocol { get }
    func initRequest<Response, Request>(
        with resource: Resource<Response, Request>
    ) async throws -> Response
}

final class RequestManager: RequestManagerProtocol {
    internal let apiClient: APIClientProtocol

    init(apiClient: APIClientProtocol = APIClient()) {
        self.apiClient = apiClient
    }

    func initRequest<Response, Request>(
        with resource: Resource<Response, Request>
    ) async throws -> Response {
        return try await apiClient.dataTask(with: resource)
    }
}
