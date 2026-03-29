//
//  AppFactory.swift
//  DealsApp
//
//  Created by Miguel Costa on 29/03/2026.
//

import SwiftData

final class AppFactory {

    private let dealsRepository: DealsRepositoryProtocol
    private let favoritesRepo: FavoritesRepository
    private let context: ModelContext

    init(
        context: ModelContext,
        dealsRepository: DealsRepositoryProtocol
    ) {
        self.context = context
        self.dealsRepository = dealsRepository
        self.favoritesRepo = FavoritesRepository(requestManager: FavoritesDealManager(context: context))
    }

    func makeDealsViewModel() -> DealsView.ViewModel {
        .init(service: dealsRepository, favoritesRepo:  favoritesRepo)
    }

    func makeFavoritesViewModel() -> FavoritesView.ViewModel {
        .init(favoritesRepo: favoritesRepo)
    }

    func makeDetailViewModel(dealId: String) -> DealDetailView.ViewModel {
        .init(service: dealsRepository, dealId: dealId)
    }
}
