//
//  DealsAppApp.swift
//  DealsApp
//
//  Created by Miguel Costa on 28/03/2026.
//

import SwiftUI

@main
struct DealsAppApp: App {
    var body: some Scene {
        WindowGroup {
            HomePageView(viewModel: .init(service: HomePageRequest(requestManager: RequestManager())))
        }
    }
}
