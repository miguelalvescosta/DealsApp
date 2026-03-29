//
//  HomePageView.swift
//  DealApp
//
//  Created by Miguel Costa on 28/03/2026.
//

import SwiftUI

struct HomePageView: View {
    @Environment(\.modelContext) private var context
    @State private var factory: AppFactory?

    var body: some View {
            Group {
                if let factory {
                    MainTabView(factory: factory)
                } else {
                    ProgressView()
                }
            }
            .task {
                if factory == nil {
                    factory = AppFactory(context: context, dealsRepository: DealsRepository(requestManager: RequestManager()))
                }
            }
        }
}
