//
//  DealsView.swift
//  DealsApp
//
//  Created by Miguel Costa on 29/03/2026.
//

import SwiftUI

struct DealsView: View {

    @State var viewModel: ViewModel
    @State private var selectedDeal: Deal?
    let makeDetail: (String) -> DealDetailView.ViewModel

    var body: some View {
        NavigationStack {
            switch viewModel.loadState {
            case .failed:
                LoadFailedView(retry: viewModel.fetchDealsList)

            case .loading:
                ProgressView("Strings.Home.loading")
                    .progressViewStyle(CircularProgressViewStyle())
                    .padding()

            default:
                List(viewModel.deals) { deal in
                    DealCardView(
                        deal: deal,
                        isFavorite: viewModel.isFavorite(deal),
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
                .navigationTitle("Deals")
            }
        }
        .task(viewModel.fetchDealsList)
    }
}
