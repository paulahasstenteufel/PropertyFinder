//
//  MockPropertyService.swift
//  PropertyFinderTests
//
//  Created by Paula Hasstenteufel on 2024-06-30.
//

import XCTest
@testable import PropertyFinder

protocol Mockable: AnyObject {
    var bundle: Bundle { get }
    func loadJSON<T: Decodable>(filename: String, type: T.Type) -> T
}

extension Mockable {
    var bundle: Bundle {
        return Bundle(for: type(of: self))
    }

    func loadJSON<T: Decodable>(filename: String, type: T.Type) -> T {
        guard let path = bundle.url(forResource: filename, withExtension: "json") else {
            fatalError("Failed to load JSON")
        }

        do {
            let data = try Data(contentsOf: path)
            let decodedObject = try JSONDecoder().decode(type, from: data)

            return decodedObject
        } catch {
            fatalError("Failed to decode loaded JSON")
        }
    }
}

final class PropertyServiceMock: Mockable, PropertyServiceable {
    var shouldFail: Bool = false
    
    func fetchOverview() async -> Result<Response, RequestError> {
        if shouldFail {
            return .failure(.unknown)
        } else {
            return .success(loadJSON(filename: "response", type: Response.self))
        }
    }
    
    func fetchDetails(id: String) async -> Result<Property, RequestError> {
        if shouldFail {
            return .failure(.unknown)
        } else {
            return .success(loadJSON(filename: "propertyDetails", type: Property.self))
        }
    }
}
