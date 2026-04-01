//
//  FavoritesManagerMock.swift
//  DealsApp
//
//  Created by Miguel Costa on 31/03/2026.
//
@testable import DealsApp

final class FavoritesManagerMock: FavoritesDealManagerProtocol {

    var storage: [Deal] = []

    func getFavorites() -> [Deal] {
        storage
    }

    func toggle(deal: Deal) {
        if let index = storage.firstIndex(where: { $0.id == deal.id }) {
            storage.remove(at: index)
        } else {
            storage.append(deal)
        }
    }

    func isFavorite(id: String) -> Bool {
        storage.contains { $0.id == id }
    }
}
