//
//  DealRepository.swift
//  DealsApp
//
//  Created by Miguel Costa on 29/03/2026.
//

import SwiftData
import Foundation

final class FavoritesDealManager: FavoritesDealManagerProtocol {
    private let context: ModelContext

    init(context: ModelContext) {
        self.context = context
    }

    func getFavorites() -> [Deal] {
        let descriptor = FetchDescriptor<FavoriteDealEntity>()
        let items = (try? context.fetch(descriptor)) ?? []
        return items.map {
            Deal(
                id: $0.id,
                title: $0.title,
                imageURL: $0.image,
                price: $0.price,
                originalPrice: $0.price,
                soldLabel: $0.soldLabel,
                company: $0.company,
                city: $0.city
            )
        }
    }

    func toggle(deal: Deal) {
            if let existing = find(id: deal.id) {
                context.delete(existing)
            } else {
                context.insert(FavoriteDealEntity(
                    id: deal.id,
                    title: deal.title,
                    image: deal.imageURL,
                    price: deal.price,
                    originalPrice: deal.originalPrice,
                    soldLabel: deal.soldLabel,
                    company: deal.company,
                    city: deal.city
                ))
            }
            try? context.save()
        }

        func isFavorite(id: String) -> Bool {
            find(id: id) != nil
        }

        private func find(id: String) -> FavoriteDealEntity? {
            let descriptor = FetchDescriptor<FavoriteDealEntity>(
                predicate: #Predicate { $0.id == id }
            )
            return try? context.fetch(descriptor).first
        }
    }
