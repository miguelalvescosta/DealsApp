//
//  RemoteImageView.swift
//  DealsApp
//
//  Created by Miguel Costa on 29/03/2026.
//

import SwiftUI

struct RemoteImageView: View {
    let url: URL?
    var placeholderHeight: CGFloat = 200
    var cornerRadius: CGFloat = 8

    var body: some View {
        AsyncImage(url: url) { phase in
            switch phase {
            case .empty:
                Color.gray
                    .frame(height: placeholderHeight)
                    .cornerRadius(cornerRadius)
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .cornerRadius(cornerRadius)
            case .failure:
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, maxHeight: placeholderHeight)
                    .foregroundColor(.gray)
                    .cornerRadius(cornerRadius)
            @unknown default:
                EmptyView()
            }
        }
    }
}
