//
//  HomePageView.swift
//  DealApp
//
//  Created by Miguel Costa on 28/03/2026.
//

import SwiftUI

struct HomePageView: View {
    @Bindable private(set) var viewModel: ViewModel

    var body: some View {
        VStack {

        }
        .task {
            await viewModel.fetchDealsList()
        }
    }
}
