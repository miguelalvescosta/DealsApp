//
//  DealDetailTests.swift
//  DealsApp
//
//  Created by Miguel Costa on 31/03/2026.
//

import Testing
@testable import DealsApp

struct DealDetailViewModelTests {

    // MARK: - Helpers

    func makeDTO(
        id: String = "1",
        price: Double? = 1000,
        originalPrice: Double? = 2000
    ) -> DealDetailDTO {

        DealDetailDTO(
            unique: id,
            title: "Title",
            image: "img",
            company: "Company",
            description: "Description",
            city: "Lisbon",
            sold_label: "Sold",
            prices: PricesDTO(
                price: price.map { PriceDetailDTO(amount: $0, currency: nil) },
                from_price: originalPrice.map { PriceDetailDTO(amount: $0, currency: nil) },
                    price_label: nil,
                    discount_label: nil
                )
        )
    }

    func makeSUT(
        dto: DealDetailDTO? = nil,
        shouldThrow: Bool = false
    ) -> DealDetailView.ViewModel {

        let service = DealsRepositoryMock()
        service.dealDetailsToReturn = dto
        service.shouldThrow = shouldThrow

        return DealDetailView.ViewModel(
            service: service,
            dealId: "1"
        )
    }

    @Test("fetchDealsList sets loaded state and data on success")
    func fetch_success() async {
        let dto = makeDTO()
        let sut = makeSUT(dto: dto)

        await sut.fetchDealsList()

        #expect(sut.loadState == .loaded)
        await #expect(sut.dealDetails?.unique == dto.unique)
    }

    @Test("fetchDealsList sets failed state on error")
    func fetch_failure() async {
        let sut = makeSUT(shouldThrow: true)

        await sut.fetchDealsList()

        #expect(sut.loadState == .failed)
        #expect(sut.dealDetails == nil)
    }

    @Test("description returns correct value")
    func description_returnsValue() async {
        let dto = makeDTO()
        let sut = makeSUT(dto: dto)

        await sut.fetchDealsList()

        #expect(sut.description == "Description")
    }

    @Test("deal returns mapped Deal when prices exist")
    func deal_mapping_success() async {
        let dto = makeDTO(price: 1000, originalPrice: 2000)
        let sut = makeSUT(dto: dto)

        await sut.fetchDealsList()

        let deal = sut.deal

        #expect(deal != nil)
        #expect(deal?.id == dto.unique)
        #expect(deal?.price == 10) // assuming fromCents = /100
    }

    @Test("deal returns nil when prices are missing")
    func deal_mapping_failure_missingPrices() async {
        let dto = makeDTO(price: nil, originalPrice: nil)
        let sut = makeSUT(dto: dto)

        await sut.fetchDealsList()

        #expect(sut.deal == nil)
    }

    @Test("initial state is loading with no data")
    func initial_state() {
        let sut = makeSUT()

        #expect(sut.loadState == .loading)
        #expect(sut.dealDetails == nil)
    }

    @Test("fetchDealsList can be called multiple times safely")
    func fetch_multiple_times() async {
        let dto = makeDTO()
        let sut = makeSUT(dto: dto)

        await sut.fetchDealsList()
        await sut.fetchDealsList()

        #expect(sut.loadState == .loaded)
        #expect(sut.dealDetails != nil)
    }

    @Test("toDeal maps correctly when all data is present")
    func toDeal_success() {
        let dto = makeDTO(price: 1000, originalPrice: 2000)

        let deal = dto.toDeal()

        #expect(deal != nil)
        #expect(deal?.price == 10)
        #expect(deal?.originalPrice == 20)
    }

    @Test("toDeal returns nil when price is missing")
    func toDeal_missingPrice() {
        let dto = makeDTO(price: nil, originalPrice: 2000)

        #expect(dto.toDeal() == nil)
    }

    @Test("toDeal returns nil when original price is missing")
    func toDeal_missingOriginalPrice() {
        let dto = makeDTO(price: 1000, originalPrice: nil)

        #expect(dto.toDeal() == nil)
    }
}
