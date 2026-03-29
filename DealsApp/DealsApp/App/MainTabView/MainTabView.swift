//
//  MainTabView.swift
//  DealsApp
//
//  Created by Miguel Costa on 29/03/2026.
//
import SwiftUI

struct MainTabView: View {

    let factory: AppFactory

    var body: some View {
        TabView {

            DealsView(
                viewModel: factory.makeDealsViewModel(),
                makeDetail: factory.makeDetailViewModel
            )
            .tabItem {
                Label("Deals", systemImage: "list.dash")
            }

            FavoritesView(
                viewModel: factory.makeFavoritesViewModel(),
                makeDetail: factory.makeDetailViewModel
            )
            .tabItem {
                Label("Favorites", systemImage: "heart")
            }

            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}
