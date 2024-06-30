//
//  PropertyService.swift
//  PropertyFinder
//
//  Created by Paula Hasstenteufel on 2024-06-30.
//

import Foundation

protocol PropertyServiceable {
    func fetchOverview() async -> Result<Response, RequestError>
    func fetchDetails(id: Int) async -> Result<Property, RequestError>
}

struct PropertyService: APIClient, PropertyServiceable {
    func fetchOverview() async -> Result<Response, RequestError> {
        return await sendRequest(endpoint: PropertyEndpoint.overview, model: Response.self)
    }
    
    func fetchDetails(id: Int) async -> Result<Property, RequestError> {
        return await sendRequest(endpoint: PropertyEndpoint.propertyDetail(id: id), model: Property.self)
    }
}
