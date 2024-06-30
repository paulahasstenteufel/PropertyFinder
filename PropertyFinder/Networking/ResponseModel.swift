//
//  ResponseModel.swift
//  PropertyFinder
//
//  Created by Paula Hasstenteufel on 2024-06-30.
//

import Foundation

struct Response: Decodable {
    let items: [ModelType]
}

enum ModelType: Decodable {
    case property(Property)
    case area(Area)

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)

        switch type {
        case "HighlightedProperty":
            var data = try Property(from: decoder)
            data.highlighted = true
            self = .property(data)
            
        case "Property":
            var data = try Property(from: decoder)
            data.highlighted = false
            self = .property(data)
            
        case "Area":
            let data = try Area(from: decoder)
            self = .area(data)
            
        default:
            throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Invalid type")
        }
    }

    enum CodingKeys: String, CodingKey {
        case type
    }
}

extension ModelType: Identifiable {
    var id: String {
        switch self {
        case .property(let model):
            return model.id
        case .area(let model):
            return model.id
        }
    }
}
