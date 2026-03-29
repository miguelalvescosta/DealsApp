//
//  DealsDetailView.swift
//  DealsApp
//
//  Created by Miguel Costa on 29/03/2026.
//
import SwiftUI

struct DealDetailView: View {
    @State var viewModel: ViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            if let deal = viewModel.deal {
                DealCardView(deal: deal, isFavoriteButtonHidden: true, description: viewModel.description)
            }
        }
        .padding()
        .navigationTitle("Deal Detail")
        .task(viewModel.fetchDealsList)
        }
    }
