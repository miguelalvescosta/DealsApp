//
//  FavoritesDealManagerTests.swift
//  DealsApp
//
//  Created by Miguel Costa on 31/03/2026.
//

import Testing
@testable import DealsApp
import SwiftData

struct FavoritesDealManagerTests {

    // MARK: - Factory

    func makeSUT() throws -> FavoritesDealManager {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: FavoriteDealEntity.self, configurations: config)
        let context = ModelContext(container)
        return FavoritesDealManager(context: context)
    }

    func makeDeal(
        id: String = "1",
        title: String = "Deal",
        price: Double = 10
    ) -> Deal {
        Deal(
            id: id,
            title: title,
            imageURL: "img",
            price: price,
            originalPrice: 20,
            soldLabel: "Sold",
            company: "Company",
            city: "Lisbon"
        )
    }

    @Test("Toggle inserts deal when not already favorite")
    func toggle_insertsDeal() throws {
        let sut = try makeSUT()
        let deal = makeDeal()

        sut.toggle(deal: deal)

        let favorites = sut.getFavorites()

        #expect(favorites.count == 1)
        #expect(favorites.first?.id == deal.id)
    }

    @Test("Toggling same deal twice results in empty favorites")
    func toggle_twice_removesDeal() throws {
        let sut = try makeSUT()
        let deal = makeDeal()

        sut.toggle(deal: deal)
        sut.toggle(deal: deal)

        #expect(sut.getFavorites().isEmpty)
    }

    @Test("isFavorite stays consistent with toggle operations")
    func isFavorite_consistency() throws {
        let sut = try makeSUT()
        let deal = makeDeal()

        #expect(!sut.isFavorite(id: deal.id))

        sut.toggle(deal: deal)
        #expect(sut.isFavorite(id: deal.id))

        sut.toggle(deal: deal)
        #expect(!sut.isFavorite(id: deal.id))
    }

    @Test("Data persists within same context lifecycle")
    func persistence_withinContext() throws {
        let sut = try makeSUT()
        let deal = makeDeal()

        sut.toggle(deal: deal)

        let result = sut.getFavorites()

        #expect(result.count == 1)
    }

    @Test("Stored deal preserves all fields correctly")
    func mapping_integrity() throws {
        let sut = try makeSUT()

        let deal = Deal(
            id: "42",
            title: "Super Deal",
            imageURL: "image_url",
            price: 99,
            originalPrice: 199,
            soldLabel: "500 sold",
            company: "Nike",
            city: "Porto"
        )

        sut.toggle(deal: deal)

        let stored = sut.getFavorites().first!

        #expect(stored.id == "42")
        #expect(stored.title == "Super Deal")
        #expect(stored.imageURL == "image_url")
        #expect(stored.price == 99)
        #expect(stored.company == "Nike")
        #expect(stored.city == "Porto")
    }

    @Test("Multiple deals are handled independently")
    func multipleDeals_independent() throws {
        let sut = try makeSUT()

        let deal1 = makeDeal(id: "1")
        let deal2 = makeDeal(id: "2")

        sut.toggle(deal: deal1)
        sut.toggle(deal: deal2)

        let favorites = sut.getFavorites()

        #expect(favorites.count == 2)
    }

    @Test("Removing one deal does not affect others")
    func removing_one_does_not_affect_others() throws {
        let sut = try makeSUT()

        let deal1 = makeDeal(id: "1")
        let deal2 = makeDeal(id: "2")

        sut.toggle(deal: deal1)
        sut.toggle(deal: deal2)

        sut.toggle(deal: deal1)

        let favorites = sut.getFavorites()

        #expect(favorites.count == 1)
        #expect(favorites.first?.id == "2")
    }

    @Test("Same ID does not create duplicates")
    func no_duplicates_for_same_id() throws {
        let sut = try makeSUT()

        let deal = makeDeal(id: "same")

        sut.toggle(deal: deal)
        sut.toggle(deal: deal)
        sut.toggle(deal: deal)

        let favorites = sut.getFavorites()

        #expect(favorites.count == 1)
    }
}
