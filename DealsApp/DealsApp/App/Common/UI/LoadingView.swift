//
//  LoadingView.swift
//  DealsApp
//
//  Created by Miguel Costa on 31/03/2026.
//

import SwiftUI

struct LoadingView: View {

    var body: some View {
        ProgressView("loading".localized)
            .progressViewStyle(CircularProgressViewStyle())
            .padding()
    }
}
