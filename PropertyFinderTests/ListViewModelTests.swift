//
//  ListViewModelTests.swift
//  PropertyFinderTests
//
//  Created by Paula Hasstenteufel on 2024-06-30.
//

import XCTest
@testable import PropertyFinder

class ListViewModelTests: XCTestCase {
    var viewModel: ListViewModel!
    var mockService: PropertyServiceMock!
    
    override func setUp() {
        super.setUp()
        mockService = PropertyServiceMock()
        viewModel = ListViewModel(service: mockService)
    }
    
    override func tearDown() {
        viewModel = nil
        mockService = nil
        super.tearDown()
    }
    
    func testFetchPropertiesSuccess() async {
        let expectation = expectation(description: "Fetch data from service")
        
        await viewModel.fetchProperties()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            XCTAssertFalse(self.viewModel.isLoading, "isLoading should be false after fetching properties")
            XCTAssertEqual(self.viewModel.items.count, 6, "Expected 6 items based on mock response")
            expectation.fulfill()
        }
        
        await fulfillment(of: [expectation])
    }

    func testFetchPropertiesFailure() async {
        let expectation = expectation(description: "Fetch data from service fails")
        
        mockService = PropertyServiceMock()
        mockService.shouldFail = true
        
        viewModel = ListViewModel(service: mockService)
        await viewModel.fetchProperties()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            XCTAssertTrue(self.viewModel.isLoading, "isLoading should be true if items is empty")
            XCTAssertTrue(self.viewModel.items.isEmpty, "Items should be empty on failure")
            expectation.fulfill()
        }
        
        await fulfillment(of: [expectation])
    }

    
    func testRowViewModelCreation() {
        let item = ModelType.property(Property(
            highlighted: "false",
            id: "123",
            askingPrice: 123456,
            monthlyFee: 1234,
            municipality: "",
            area: "",
            daysSincePublish: 1,
            livingArea: 123,
            numberOfRooms: 1,
            streetAddress: "",
            image: "",
            description: nil,
            patio: nil
        ))

        let rowViewModel = viewModel.row(for: item)

        XCTAssertNotNil(rowViewModel.property, "Property should have a value")
        XCTAssertNil(rowViewModel.area, "Area should be nil")
    }
}
