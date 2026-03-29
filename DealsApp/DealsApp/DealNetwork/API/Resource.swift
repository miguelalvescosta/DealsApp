//
//  Resource.swift
//  DealApp
//
//  Created by Miguel Costa on 28/03/2026.
//
import Foundation

struct Resource<Response, Request: Requestable> {
    let request: Request
    let decode: (Data) throws -> Response
}

extension Resource where Response: Decodable {
    init(request: Request) {
        self.init(request: request) { data in
            return try JSONDecoder().decode(Response.self, from: data)
        }
    }
}

extension Resource where Response == Void {
    init(request: Request) {
        self.init(request: request) { _ in return () }
    }
}
