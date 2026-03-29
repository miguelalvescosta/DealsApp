//
//  HomePageRequest.swift
//  DealApp
//
//  Created by Miguel Costa on 28/03/2026.
//
import Foundation

// MARK: - Users
private let pathToUsers = "demo/deals.json"

struct FetchDealsListRequest: Requestable {
    let path = pathToUsers
    //let headers: [HTTPHeaderKey : String] = [.userAgent: "Mozilla/5.0"]
}

actor HomePageRequest {
  private let requestManager: RequestManagerProtocol

  init(requestManager: RequestManagerProtocol) {
    self.requestManager = requestManager
  }
}

extension HomePageRequest: HomePageAPIProtocol {
    @MainActor
    func fetchDeals() async throws -> [Deal] {
        let request = FetchDealsListRequest()
        let resource = Resource<[Deal], FetchDealsListRequest>(request: request)
        return try await requestManager.initRequest(with: resource)
  }
}
