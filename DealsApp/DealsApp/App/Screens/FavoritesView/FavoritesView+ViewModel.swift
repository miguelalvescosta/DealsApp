//
//  FavoritesViewModel.swift
//  DealsApp
//
//  Created by Miguel Costa on 29/03/2026.
//

import Observation
import Combine

import Observation

extension FavoritesView {

    @Observable
    final class ViewModel {

        private let favoritesRepo: FavoritesRepository

        init(favoritesRepo: FavoritesRepository) {
            self.favoritesRepo = favoritesRepo
        }

        var deals: [Deal] {
            favoritesRepo.favorites
        }

        func toggleFavorite(_ deal: Deal) {
            favoritesRepo.toggle(deal: deal)
        }

        func isFavorite(_ deal: Deal) -> Bool {
            favoritesRepo.isFavorite(id: deal.id)
        }
    }
}
