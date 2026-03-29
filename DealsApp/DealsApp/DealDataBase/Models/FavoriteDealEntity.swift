//
//  FavoriteDealEntity.swift
//  DealsApp
//
//  Created by Miguel Costa on 29/03/2026.
//
import SwiftData

@Model
final class FavoriteDealEntity {

    @Attribute(.unique) var id: String
    var title: String
    var image: String
    var price: Double
    var originalPrice: Double
    var soldLabel: String
    var company: String
    var city: String

     init(
        id: String,
        title: String,
        image: String,
        price: Double,
        originalPrice: Double,
        soldLabel: String,
        company: String,
        city: String
     ) {
        self.id = id
        self.title = title
        self.image = image
        self.price = price
        self.originalPrice = originalPrice
        self.soldLabel = soldLabel
        self.company = company
        self.city = city
    }
}
