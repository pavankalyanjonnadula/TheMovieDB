//
//  TheMovieDBTests.swift
//  TheMovieDBTests
//
//  Created by Jonnadula Pavan Kalyan  on 25/10/23.
//

import XCTest
@testable import TheMovieDB

final class TheMovieDBTests: XCTestCase {

    var viewModel: MoviesViewModel! // Replace with your ViewModel class
    
    override func setUpWithError() throws {
        viewModel = MoviesViewModel()
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetAllNowPlayingMovies() throws {
        let expectation = self.expectation(description: "Movies request")
        viewModel.getAllMovies(apiUrl: ApiUrls.nowPlayingMovies) { (movies) in
            XCTAssertFalse(movies.isEmpty, "Movies should not be empty")
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testGetAllTopRatedMovies() throws {
        let expectation = self.expectation(description: "Movies request")
        
        viewModel.getAllMovies(apiUrl: ApiUrls.topRatedMovies) { (movies) in
            XCTAssertFalse(movies.isEmpty, "Movies should not be empty")
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
