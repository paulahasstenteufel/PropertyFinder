//
//  APIRequest.swift
//  PropertyFinder
//
//  Created by Paula Hasstenteufel on 2024-06-29.
//

import Foundation

protocol Endpoint {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var method: String { get }
}

enum PropertyEndpoint {
    case overview
    case propertyDetail(id: Int)
}

extension PropertyEndpoint: Endpoint {
    var scheme: String { "https" }
    var host: String { "pastebin.com" }
    var method: String { "GET" }
    var path: String {
        switch self {
        case .overview: return "raw/nH5NinBi"
        case .propertyDetail(let id): return "raw/uj6vtukE"
        }
    }
}

enum RequestError: Error {
    case invalidURL
    case noData
    case unknown
    
    var customMessage: String {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .noData:
            return "No Data"
        case .unknown:
            return "Unexpected Error"
        }
    }
}
