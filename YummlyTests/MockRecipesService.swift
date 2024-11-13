//
//  MockRecipesService.swift
//  YummlyTests
//
//  Created by Tristan Newman on 11/12/24.
//

import XCTest
@testable import Yummly

class MockRecipesService: RecipesServiceProtocol {
    var getRecipesExpectation: XCTestExpectation?
    var valideRecipes: [Recipe] = []
    
    func getRecipes() async throws -> [Recipe] {
        getRecipesExpectation?.fulfill()
        return []
    }
}
