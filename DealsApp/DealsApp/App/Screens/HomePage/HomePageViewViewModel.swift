//
//  HomePageViewViewModel.swift
//  DealApp
//
//  Created by Miguel Costa on 28/03/2026.
//

import Observation

/*xtension HomePageView {
    enum LoadState {
        case loading, loaded, failed
    }

    @Observable
    final class ViewModel {
        private(set) var deals: [Deal] = []
        private let service: DealsRepositoryProtocol

        init(service: DealsRepositoryProtocol) {
            self.service = service
        }

        func fetchDealsList() async {
            do {
                let response = try await service.fetchDeals()
                deals = response.compactMap { $0.toDomain() }
            } catch {
                dump(error)
            }
        }
    }
}*/
