//
//  iOS_Assignment1Tests.swift
//  iOS Assignment1Tests
//
//  Created by Prasad.d on 04/07/18.
//  Copyright © 2018 Prasad.d. All rights reserved.
//

import XCTest
@testable import iOS_Assignment1

class iOS_Assignment1Tests: XCTestCase {
    let listViewController = ViewController()
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
   
    func test_count_nil_check() {
        listViewController.viewModel.fetchData(listFeed: .listFeed) {  results in
        XCTAssertNotNil(results, "The object is Not Nil")
        }
    }
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
