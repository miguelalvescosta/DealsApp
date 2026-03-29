//
//  HomePageAPIProtocol.swift
//  DealApp
//
//  Created by Miguel Costa on 28/03/2026.
//

protocol DealsRepositoryProtocol {
    func fetchDeals() async throws -> [Deal]
    func fetchDealsDetails(id: String) async throws -> DealDetailDTO
}
