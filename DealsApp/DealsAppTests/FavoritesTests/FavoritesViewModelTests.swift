//
//  FavoritesViewModelTests.swift
//  DealsApp
//
//  Created by Miguel Costa on 31/03/2026.
//

import Testing
@testable import DealsApp

struct FavoritesViewModelTests {

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

    func makeSUT(initial: [Deal] = []) -> FavoritesView.ViewModel {
        let manager = FavoritesManagerMock()
        manager.storage = initial

        let repo = FavoritesRepository(requestManager: manager)
        return FavoritesView.ViewModel(favoritesRepo: repo)
    }

    @Test("deals reflects repository favorites")
    func deals_reflectsRepository() {
        let deal = makeDeal()
        let sut = makeSUT(initial: [deal])

        #expect(sut.deals.count == 1)
        #expect(sut.deals.first?.id == deal.id)
    }

    @Test("toggleFavorite updates deals list")
    func toggle_updatesDeals() {
        let sut = makeSUT()
        let deal = makeDeal()

        sut.toggleFavorite(deal)

        #expect(sut.deals.count == 1)
    }

    @Test("toggleFavorite twice removes deal")
    func toggle_twice_removesDeal() {
        let sut = makeSUT()
        let deal = makeDeal()

        sut.toggleFavorite(deal)
        sut.toggleFavorite(deal)

        #expect(sut.deals.isEmpty)
    }

    @Test("isFavorite reflects current state")
    func isFavorite_consistency() {
        let sut = makeSUT()
        let deal = makeDeal()

        #expect(!sut.isFavorite(deal))

        sut.toggleFavorite(deal)

        #expect(sut.isFavorite(deal))
    }

    @Test("multiple deals handled correctly")
    func multipleDeals() {
        let sut = makeSUT()

        let deal1 = makeDeal(id: "1")
        let deal2 = makeDeal(id: "2")

        sut.toggleFavorite(deal1)
        sut.toggleFavorite(deal2)

        #expect(sut.deals.count == 2)
    }

    @Test("removing one deal does not affect others")
    func removing_one_does_not_affect_others() {
        let sut = makeSUT()

        let deal1 = makeDeal(id: "1")
        let deal2 = makeDeal(id: "2")

        sut.toggleFavorite(deal1)
        sut.toggleFavorite(deal2)
        sut.toggleFavorite(deal1)

        #expect(sut.deals.count == 1)
        #expect(sut.deals.first?.id == "2")
    }

    @Test("initial state is empty")
    func initial_empty() {
        let sut = makeSUT()

        #expect(sut.deals.isEmpty)
    }
}
