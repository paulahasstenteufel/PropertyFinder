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
    var header: [String: String]? { get }
    var body: [String: String]? { get }
}

extension Endpoint {
    var scheme: String { "https" }
    var host: String { "pastebin.com" }
    var path: String { "raw/nH5NinBi" }
    var method: String { "GET" }
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
