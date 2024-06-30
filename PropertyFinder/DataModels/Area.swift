//
//  Area.swift
//  PropertyFinder
//
//  Created by Paula Hasstenteufel on 2024-06-29.
//

import Foundation

struct Area {
    let id: String
    let area: String
    let ratingFormatted: String?
    let averagePrice: Decimal?
    let image: String?
}

extension Area: Identifiable, Decodable { }
