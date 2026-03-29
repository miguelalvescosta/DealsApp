//
//  DealDetailDTO.swift
//  DealsApp
//
//  Created by Miguel Costa on 29/03/2026.
//

struct DealDetailDTO: Decodable {
    let unique: String
    let title: String
    let image: String
    let company: String
    let description: String
    let city: String
    let sold_label: String
    let prices: PricesDTO?
}

extension DealDetailDTO {
    func toDeal() -> Deal? {
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
