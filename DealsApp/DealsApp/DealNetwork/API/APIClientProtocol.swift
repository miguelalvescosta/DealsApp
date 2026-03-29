//
//  APIClientProtocol.swift
//  DealApp
//
//  Created by Miguel Costa on 28/03/2026.
//

protocol APIClientProtocol {
    func dataTask<Response, Request>(
        with resource: Resource<Response, Request>
    ) async throws -> Response
}
