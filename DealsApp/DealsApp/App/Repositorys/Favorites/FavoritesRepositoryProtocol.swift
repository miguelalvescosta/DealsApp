//
//  FavoritesRepositoryProtocol.swift
//  DealsApp
//
//  Created by Miguel Costa on 29/03/2026.
//

import Combine

protocol FavoritesRepositoryProtocol {
    func getFavorites() -> [Deal]
    func toggle(deal: Deal)
    func isFavorite(id: String) -> Bool
}
