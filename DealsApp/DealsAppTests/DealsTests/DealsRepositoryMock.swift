//
//  DealsRepositoryMock.swift
//  DealsApp
//
//  Created by Miguel Costa on 31/03/2026.
//
import Testing
@testable import DealsApp
import Foundation

final class DealsRepositoryMock: DealsRepositoryProtocol {
    
    var dealsToReturn: [Deal] = []
    var dealDetailsToReturn: DealDetailDTO?
    var shouldThrow = false
    
    func fetchDeals() async throws -> [Deal] {
        if shouldThrow {
            throw NSError(domain: "test", code: 1)
        }
        return dealsToReturn
    }
    
    func fetchDealsDetails(id: String) async throws -> DealDetailDTO {
        if shouldThrow {
            throw NSError(domain: "test", code: 1)
        }
        return dealDetailsToReturn!
    }
}
