//
//  RowViewModel.swift
//  PropertyFinder
//
//  Created by Paula Hasstenteufel on 2024-06-30.
//

import Foundation

class RowViewModel: ObservableObject {
    @Published var property: Property?
    @Published var area: Area?
    
    init(modelType: ModelType) {
        switch modelType {
        case .area(let model): 
            area = model
        case .property(let model):
            property = model
        }
    }
    
    func getPropertyDetails() {
        guard let property else { return }
        
        Task {
            await fetchPropertyDetails(id: property.id)
        }
    }
    
    // MARK: Private
    private let propertyService: PropertyServiceable = PropertyService()
    
    private func fetchPropertyDetails(id: String) async {
        let result = await propertyService.fetchDetails(id: "")
        do {
            let response = try result.get()
            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                self.property?.description = response.description
                self.property?.patio = response.patio
            }
            
        } catch {
            // Next steps: Add UI error handling
            print(error.localizedDescription)
        }
    }
}
