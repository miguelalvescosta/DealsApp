//
//  DealDTOModel.swift
//  DealsApp
//
//  Created by Miguel Costa on 29/03/2026.
//

struct DealsResponseDTO: Decodable {
    let num_deals: Int
    let deals: [DealDTO]
}

struct DealDTO: Decodable {
    let unique: String
    let title: String
    let image: String
    let company: String
    let city: String
    let sold_label: String
    let prices: PricesDTO?
}

struct PricesDTO: Decodable {
    let price: PriceDetailDTO?
    let from_price: PriceDetailDTO?
    let price_label: String?
    let discount_label: String?
}

struct PriceDetailDTO: Decodable {
    let amount: Double?
    let currency: CurrencyDTO?
}

struct CurrencyDTO: Decodable {
    let symbol: String?
    let code: String?
}

extension DealDTO {
    func toDomain() -> Deal? {
        guard let priceAmount = prices?.price?.amount,
              let fromPriceAmount = prices?.from_price?.amount else {
            return nil
        }

        return Deal(
            id: unique,
            title: title,
            imageURL: image,
            price: priceAmount.fromCents,
            originalPrice: fromPriceAmount.fromCents,
            soldLabel: sold_label,
            company: company,
            city: city
        )
    }
}
