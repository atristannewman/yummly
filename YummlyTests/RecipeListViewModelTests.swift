//
//  RecipeListViewModelTest.swift
//  YummlyTests
//
//  Created by Tristan Newman on 11/12/24.
//

import XCTest
@testable import Yummly
  
final class RecipeListViewModelTest: XCTestCase {
    
    var viewModel: RecipeListViewModel!
    
    override func setUp() async throws {
        try await super.setUp()
        
        viewModel = await MainActor.run {
            RecipeListViewModel()
        }
    }
    
    func testOnAppearWithSuccessfulFetch() async throws {
        let mockService = MockRecipesService()
        
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
      
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        XCTAssertTrue(true)
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        XCTAssertTrue(viewModel != nil)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
        
        XCTAssertTrue(true)
    }

}
