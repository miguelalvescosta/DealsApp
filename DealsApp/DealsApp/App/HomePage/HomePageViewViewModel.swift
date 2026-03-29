//
//  HomePageViewViewModel.swift
//  DealApp
//
//  Created by Miguel Costa on 28/03/2026.
//

import Observation

@Observable
final class ViewModel {
    private(set) var deals: [Deal] = []
    private let service: HomePageAPIProtocol

    init(service: HomePageAPIProtocol) {
        self.service = service
    }

    func fetchDealsList() async {
        do {
            let response = try await service.fetchDeals()
            deals = response
        } catch {
            dump(error)
        }
    }
}
