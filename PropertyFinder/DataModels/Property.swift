//
//  Property.swift
//  PropertyFinder
//
//  Created by Paula Hasstenteufel on 2024-06-29.
//

import Foundation

struct Property {
    var highlighted: String?
    let id: String
    let askingPrice: Decimal?
    let monthlyFee: Decimal?
    let municipality: String?
    let area: String?
    let daysSincePublish: Int?
    let livingArea: Decimal?
    let numberOfRooms: Int?
    let streetAddress: String?
    let image: String?
    var description: String?
    var patio: String?
}

extension Property: Identifiable, Decodable { }

extension Property {
    mutating func updateWithDetails(_ details: Property) {
        self.description = details.description
        self.patio = details.patio
    }
}
