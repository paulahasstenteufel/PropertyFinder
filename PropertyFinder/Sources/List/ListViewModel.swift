//
//  ListViewModel.swift
//  PropertyFinder
//
//  Created by Paula Hasstenteufel on 2024-06-30.
//

import SwiftUI

class ListViewModel: ObservableObject {
    @Published var items: [ModelType] = []

    init() {
        Task { await fetchProperties() }
    }
    
    // MARK: Private
    private let propertyService: PropertyServiceable = PropertyService()

    private func fetchProperties() async {
        let result = await propertyService.fetchOverview()
        do {
            let response = try result.get()
            items = response.items
            
        } catch {
            print(error.localizedDescription)
        }
    }
}

