//
//  FavoritesView.swift
//  DealsApp
//
//  Created by Miguel Costa on 29/03/2026.
//

import SwiftUI

struct FavoritesView: View {

    @State var viewModel: ViewModel
    @State private var selectedDeal: Deal?
    let makeDetail: (String) -> DealDetailView.ViewModel

    var body: some View {
        NavigationStack {
            List(viewModel.deals) { deal in
                DealCardView(
                    deal: deal,
                    isFavorite: true,
                    onFavorite: {
                        viewModel.toggleFavorite(deal)
                    }
                )
                .contentShape(Rectangle())
                .onTapGesture {
                    selectedDeal = deal
                }
            }
            .navigationDestination(item: $selectedDeal) { deal in
                DealDetailView(
                    viewModel: makeDetail(deal.id)
                )
            }
            .navigationTitle("Favorites")
        }
    }
}
