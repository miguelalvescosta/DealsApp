//
//  HomePageAPIProtocol.swift
//  DealApp
//
//  Created by Miguel Costa on 28/03/2026.
//

protocol HomePageAPIProtocol {
    func fetchDeals() async throws -> [Deal]
}
