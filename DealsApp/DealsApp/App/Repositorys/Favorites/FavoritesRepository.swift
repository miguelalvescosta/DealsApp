//
//  FavoritesRepository.swift
//  DealsApp
//
//  Created by Miguel Costa on 29/03/2026.
//

import Observation
import Foundation
import Combine


@Observable
final class FavoritesRepository: FavoritesRepositoryProtocol {

    private let requestManager: FavoritesDealManagerProtocol

    private(set) var favorites: [Deal] = []

    init(requestManager: FavoritesDealManagerProtocol) {
        self.requestManager = requestManager
        self.favorites = requestManager.getFavorites()
    }

    func getFavorites() -> [Deal] {
        favorites
    }

    func toggle(deal: Deal) {
        requestManager.toggle(deal: deal)
        favorites = requestManager.getFavorites()
    }

    func isFavorite(id: String) -> Bool {
        favorites.contains { $0.id == id }
    }
}
