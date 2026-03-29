//
//  DealModel.swift
//  DealApp
//
//  Created by Miguel Costa on 28/03/2026.
//

struct Deal: Identifiable, Hashable {
    let id: String
    let title: String
    let imageURL: String
    let price: Double
    let originalPrice: Double
    let soldLabel: String
    let company: String
    let city: String
}
