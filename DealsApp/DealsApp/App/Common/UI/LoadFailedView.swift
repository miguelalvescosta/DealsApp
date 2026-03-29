//
//  LoadFailedView.swift
//  DealsApp
//
//  Created by Miguel Costa on 29/03/2026.
//

import SwiftUI

struct LoadFailedView: View {
    var retry: () async -> Void

    var body: some View {
        ContentUnavailableView {
            Text("Load Error")
                .font(.headline)
        } description: {
            Text("There was an error loading the articles.")
        } actions: {
            Button("Retry") {
                Task {
                    await retry()
                }
            }
        }
    }
}
