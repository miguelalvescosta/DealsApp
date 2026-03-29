//
//  DealsDetailView+ViewModel.swift
//  DealsApp
//
//  Created by Miguel Costa on 29/03/2026.
//

import Observation
import Combine

extension DealDetailView {
    enum LoadState {
        case loading, loaded, failed
    }

    @Observable
    final class ViewModel {
        private(set) var dealDetails: DealDetailDTO?
        private(set) var loadState: LoadState = .loading

        private let service: DealsRepositoryProtocol
        private let dealId: String

        var description: String? {
            dealDetails?.description
        }

        var deal: Deal? {
            dealDetails?.toDeal()
        }

        init(service: DealsRepositoryProtocol, dealId: String) {
            self.service = service
            self.dealId = dealId
        }

        func fetchDealsList() async {
            do {
                let response = try await service.fetchDealsDetails(id: dealId)
                dealDetails = response
                loadState = .loaded
            } catch {
                loadState = .failed
            }
        }
    }
}
