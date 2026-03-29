//
//  DealsViewViewModel.swift
//  DealsApp
//
//  Created by Miguel Costa on 29/03/2026.
//

import Observation
import Combine

extension DealsView {
    enum LoadState {
        case loading, loaded, failed
    }

    @Observable
    final class ViewModel {

        private(set) var deals: [Deal] = []
        private(set) var loadState: LoadState = .loading

        let service: DealsRepositoryProtocol
        let favoritesRepo: FavoritesRepository

        init(service: DealsRepositoryProtocol,
             favoritesRepo: FavoritesRepository) {
            self.service = service
            self.favoritesRepo = favoritesRepo
        }

        func fetchDealsList() async {
            loadState = .loading
            do {
                deals = try await service.fetchDeals()
                loadState = .loaded
            } catch {
                loadState = .failed
            }
        }

        func toggleFavorite(_ deal: Deal) {
            favoritesRepo.toggle(deal: deal)
        }

        func isFavorite(_ deal: Deal) -> Bool {
            favoritesRepo.isFavorite(id: deal.id)
        }
    }
}
