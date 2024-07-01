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
    
    let propertyService: PropertyServiceable
    
    init(service: PropertyServiceable) {
        propertyService = service
        Task {
            await fetchProperties()
        }
    }
    
    func row(for item: ModelType) -> RowViewModel {
        return RowViewModel(service: propertyService, modelType: item)
    }
    
    func fetchProperties() async {
        let result = await propertyService.fetchOverview()
        do {
            let response = try result.get()
            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                self.items = response.items
                self.isLoading = items.isEmpty
            }
            
        } catch {
            // Next steps: Add UI error handling
            print(error.localizedDescription)
        }
    }
}

