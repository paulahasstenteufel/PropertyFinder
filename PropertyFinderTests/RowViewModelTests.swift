//
//  ListViewModelTests.swift
//  PropertyFinderTests
//
//  Created by Paula Hasstenteufel on 2024-06-30.
//

import XCTest
@testable import PropertyFinder

class RowViewModelTests: XCTestCase {
    var viewModel: RowViewModel!
    var mockService: PropertyServiceMock!
    
    override func setUp() {
        super.setUp()
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
        mockService = PropertyServiceMock()
        
        viewModel = RowViewModel(service: mockService, modelType: item)
    }
    
    override func tearDown() {
        viewModel = nil
        mockService = nil
        super.tearDown()
    }
    
    func testInitialization() {
        XCTAssertEqual(self.viewModel.property?.livingArea, 123, "Property should match mocked item")
    }
    
    func testFetchPropertiesSuccess() async {
        let expectation = expectation(description: "Fetch data from service")
        
        await viewModel.fetchPropertyDetails(id: "")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            XCTAssertNotNil(self.viewModel.property?.description, "Description should be available after fetching property details")
            expectation.fulfill()
        }
        
        await fulfillment(of: [expectation])
    }

    func testFetchPropertiesFailure() async {
        let expectation = expectation(description: "Fetch data from service fails")
        
        mockService.shouldFail = true
        viewModel.property?.description = nil
        viewModel.property?.patio = nil
        
        await viewModel.fetchPropertyDetails(id: "")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            XCTAssertNil(self.viewModel.property?.description, "Description should be empty if fetching property details fails")
            expectation.fulfill()
        }
        
        await fulfillment(of: [expectation])
    }
}
