//
//  RecipeListViewModelTest.swift
//  YummlyTests
//
//  Created by Tristan Newman on 11/12/24.
//

import XCTest
@testable import Yummly
  
class RecipeListViewModelTest: XCTestCase {
    
    private var viewModel: RecipeListViewModel!
    private var mockService: MockRecipesService!
    
    override func setUp() async throws {
        try await super.setUp()
        
        mockService = MockRecipesService()
        viewModel = await RecipeListViewModel(recipeService: mockService)
    }
    
    func testIdealOnAppearTraits() async throws {
        let onAppearExpectation = expectation(description: "On appear")
        
        Task { @MainActor in
            try await viewModel.start()
            onAppearExpectation.fulfill()
            
            XCTAssertFalse(viewModel.isLoading)
            XCTAssertNil(viewModel.errorMessage)
        }
        
        await fulfillment(of: [onAppearExpectation], timeout: 1.0)
    }
    
    func testOnAppearWithNormalGetRecipesJson() async throws {
        mockService.responseType = .normal
        
        try await viewModel.start()
        
        await MainActor.run {
            XCTAssertGreaterThan(viewModel.recipes.count, 0)
        }
    }
    
    func testOnAppearWithMalformedGetRecipesJson() async throws {
        mockService.responseType = .malformed
        
        try await viewModel.start()
        
        await MainActor.run {
            XCTAssertGreaterThan(viewModel.recipes.count, 0)
        }
    }
    
    func testOnAppearWithEmptyGetRecipesJson() async throws {
        mockService.responseType = .empty
        
        try await viewModel.start()
        
        await MainActor.run {
            XCTAssertEqual(viewModel.recipes.count, 0)
        }
    }
    
    func testOnAppearWhenNetworkIsNotReachable() async throws {

        try await viewModel.start()

        await MainActor.run {
            XCTAssertFalse(viewModel.isConnected)
        }
    }
    
    func testOnAppearPerformance() throws {
        measure(metrics: [XCTCPUMetric(), XCTMemoryMetric(), XCTClockMetric()]) {
            let expectation = expectation(description: "onAppear completion")
            
            Task {
                do {
                    try await viewModel.start()
                    expectation.fulfill()
                } catch {
                    XCTFail("onAppear failed with error: \(error)")
                }
            }
            
            wait(for: [expectation], timeout: 5.0)
        }
    }
    
    override func tearDown() {
        mockService = nil
        viewModel = nil
        super.tearDown()
    }
    
}
