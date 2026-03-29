//
//  DealModel.swift
//  DealApp
//
//  Created by Miguel Costa on 28/03/2026.
//

struct Deal: Identifiable, Codable {
    let id: String
    let title: String
    let price: Double
    let image: String
}
