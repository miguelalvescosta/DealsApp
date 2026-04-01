//
//  DealsViewModelTests.swift
//  DealsApp
//
//  Created by Miguel Costa on 31/03/2026.
//

import Testing
@testable import DealsApp

struct DealsViewModelTests {

    // MARK: - Helpers

    func makeDeal(id: String = "1") -> Deal {
        Deal(
            id: id,
            title: "Deal",
            imageURL: "img",
            price: 10,
            originalPrice: 20,
            soldLabel: "Sold",
            company: "Company",
            city: "Lisbon"
        )
    }

    func makeSUT(
        deals: [Deal] = [],
        shouldThrow: Bool = false
    ) -> DealsView.ViewModel {

        let service = DealsRepositoryMock()
        service.dealsToReturn = deals
        service.shouldThrow = shouldThrow

        let favoritesManager = FavoritesManagerMock()
        let favoritesRepo = FavoritesRepository(requestManager: favoritesManager)

        return DealsView.ViewModel(
            service: service,
            favoritesRepo: favoritesRepo
        )
    }

    @Test("fetchDealsList sets loaded state on success")
    func fetchDeals_success_setsLoaded() async {
        let deal = makeDeal()
        let sut = makeSUT(deals: [deal])

        await sut.fetchDealsList()

        #expect(sut.loadState == .loaded)
        #expect(sut.deals.count == 1)
    }

    @Test("fetchDealsList sets failed state on error")
    func fetchDeals_failure_setsFailed() async {
        let sut = makeSUT(shouldThrow: true)

        await sut.fetchDealsList()

        #expect(sut.loadState == .failed)
        #expect(sut.deals.isEmpty)
    }

    @Test("initial state is loading with empty deals")
    func initial_state() {
        let sut = makeSUT()

        #expect(sut.loadState == .loading)
        #expect(sut.deals.isEmpty)
    }

    @Test("toggleFavorite updates favorites repository")
    func toggleFavorite_updatesRepo() {
        let sut = makeSUT()
        let deal = makeDeal()

        sut.toggleFavorite(deal)

        #expect(sut.isFavorite(deal))
    }

    @Test("isFavorite reflects toggled state")
    func isFavorite_reflectsState() {
        let sut = makeSUT()
        let deal = makeDeal()

        #expect(!sut.isFavorite(deal))

        sut.toggleFavorite(deal)

        #expect(sut.isFavorite(deal))
    }

}
