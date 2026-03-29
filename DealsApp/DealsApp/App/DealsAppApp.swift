//
//  DealsAppApp.swift
//  DealsApp
//
//  Created by Miguel Costa on 28/03/2026.
//

import SwiftUI
import SwiftData

@main
struct DealsAppApp: App {
    @StateObject private var settings = Settings()
    var body: some Scene {
        WindowGroup {
            HomePageView()
                .environmentObject(settings)
        }
        .modelContainer(for: [FavoriteDealEntity.self])
    }
}
