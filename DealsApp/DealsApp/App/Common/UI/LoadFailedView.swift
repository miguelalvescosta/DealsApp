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
            Text("error_title".localized)
                .font(.headline)
        } description: {
            Text("error_subtitle".localized)
        } actions: {
            Button("retry_title".localized) {
                Task {
                    await retry()
                }
            }
        }
    }
}
