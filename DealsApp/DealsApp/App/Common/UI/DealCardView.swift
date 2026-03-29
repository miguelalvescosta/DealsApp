//
//  DealRow.swift
//  DealsApp
//
//  Created by Miguel Costa on 29/03/2026.
//

import SwiftUI

struct DealCardView: View {
    @EnvironmentObject var settings: Settings

    let deal: Deal
    let isFavorite: Bool
    let onFavorite: (() -> Void)?
    var isFavoriteButtonHidden: Bool
    var description: String?

    init(
        deal: Deal,
        isFavorite: Bool = false,
        onFavorite: (() -> Void)? = nil,
        isFavoriteButtonHidden: Bool = false,
        description: String? = nil
    ) {
        self.deal = deal
        self.isFavorite = isFavorite
        self.onFavorite = onFavorite
        self.isFavoriteButtonHidden = isFavoriteButtonHidden
        self.description = description
    }

    var imageUrl: URL? {
        ImageURLBuilder.build(path: deal.imageURL)
    }

    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .bottomTrailing) {
                RemoteImageView(url: imageUrl)

                if !isFavoriteButtonHidden {
                    Button(action: onFavorite ?? {}) {
                        Image(systemName: isFavorite ? "heart.fill" : "heart")
                            .padding(10)
                            .foregroundColor(.red)
                            .background(.black.opacity(0.6))
                            .clipShape(Circle())
                    }
                    .buttonStyle(.plain)
                }
            }

            VStack(alignment: .leading, spacing: 5) {
                Text(deal.title)

                Text(deal.company)
                    .font(.subheadline)

                if let description  {
                    Text(description)
                        .font(.subheadline)
                }

                Text(deal.city)
                    .font(.caption)
                    .foregroundColor(.gray)

                HStack {

                    Text(deal.soldLabel)
                        .foregroundColor(.red)

                    Spacer()

                    if deal.originalPrice > deal.price {
                        Text(deal.originalPrice.formattedPrice(currency: settings.selectedCurrency))
                            .strikethrough()
                            .foregroundColor(.gray)
                    }

                    Text(deal.price.formattedPrice(currency: settings.selectedCurrency))
                        .font(.headline)
                }
            }
        }
    }
}

struct ImageURLBuilder {
    static func build(path: String) -> URL? {
        URL(string: "https://images.socialdeal.nl\(path)")
    }
}

