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
                Label("deals_screen_title".localized, systemImage: "list.dash")
            }

            FavoritesView(
                viewModel: factory.makeFavoritesViewModel(),
                makeDetail: factory.makeDetailViewModel
            )
            .tabItem {
                Label("favorites_screen_title".localized, systemImage: "heart")
            }

            SettingsView()
                .tabItem {
                    Label("settings_screen_title".localized, systemImage: "gear")
                }
        }
    }
}
