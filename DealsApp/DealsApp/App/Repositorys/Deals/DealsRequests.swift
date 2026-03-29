//
//  DealsRequests.swift
//  DealsApp
//
//  Created by Miguel Costa on 29/03/2026.
//

import Foundation

private let pathDealsList = "demo/deals.json"

struct FetchDealsListRequest: Requestable {
    let path = pathDealsList
}

private let pathDealsDetails = "demo/details.json"

struct FetchDealsDetailsRequest: Requestable {
    let path = pathDealsDetails

    let parameters: [URLQueryItem]

    init(id: String) {
        parameters = [
            URLQueryItem(name: "id", value: id)
        ]
    }
}
