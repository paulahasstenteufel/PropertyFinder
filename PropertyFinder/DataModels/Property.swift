//
//  Property.swift
//  PropertyFinder
//
//  Created by Paula Hasstenteufel on 2024-06-29.
//

import Foundation

struct Property {
    let highlighted: Bool
    let id: String
    let askingPrice: Decimal?
    let monthlyFee: Decimal?
    let municipality: String?
    let area: String
    let daysSincePublish: Int?
    let livingArea: Double?
    let numberOfRooms: Int?
    let streetAddress: String?
    let imageURL: String
}
