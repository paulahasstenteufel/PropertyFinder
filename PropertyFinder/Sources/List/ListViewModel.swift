//
//  ListViewModel.swift
//  PropertyFinder
//
//  Created by Paula Hasstenteufel on 2024-06-30.
//

import SwiftUI

class ListViewModel: ObservableObject {
    @Published var isLoading = true
    @Published var items: [ModelType] = []
    
    init() {
        Task {
            await fetchProperties()
        }
    }
    
    func row(for item: ModelType) -> RowViewModel {
        return RowViewModel(modelType: item)
    }
    
    // MARK: Private
    private let propertyService: PropertyServiceable = PropertyService()

    private func fetchProperties() async {
        let result = await propertyService.fetchOverview()
        do {
            let response = try result.get()
            items = response.items
            isLoading = false
            
        } catch {
            // Next steps: Add UI error handling 
            print(error.localizedDescription)
        }
    }
}

