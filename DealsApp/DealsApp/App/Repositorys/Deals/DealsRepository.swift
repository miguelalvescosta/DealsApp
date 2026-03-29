//
//  HomePageRepository.swift
//  DealApp
//
//  Created by Miguel Costa on 28/03/2026.
//
import Foundation

actor DealsRepository {
    private let requestManager: RequestManagerProtocol
    
    init(requestManager: RequestManagerProtocol) {
        self.requestManager = requestManager
    }
}

extension DealsRepository: DealsRepositoryProtocol {
    @MainActor
    func fetchDeals() async throws -> [Deal] {
        let request = FetchDealsListRequest()
        let resource = Resource<DealsResponseDTO, FetchDealsListRequest>(request: request)
        let response = try await requestManager.initRequest(with: resource)
        return response.deals.compactMap { $0.toDomain() }
    }
}

extension DealsRepository {
    @MainActor
    func fetchDealsDetails(id: String) async throws -> DealDetailDTO {
        let request = FetchDealsDetailsRequest(id: id)
        let resource = Resource<DealDetailDTO, FetchDealsDetailsRequest>(request: request)
        return try await requestManager.initRequest(with: resource)
    }
}
