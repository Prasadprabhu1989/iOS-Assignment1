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
     let session = URLSessionMock()
    var client = ListAPIClient()
    override func setUp() {
        super.setUp()
        
         client = ListAPIClient(session: session)
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    func testTableViewCellReUsableIdentifier(){
        let cell = listViewController.tableView(listViewController.mainView.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as? TableViewListCell
        let actualIdentifier = cell?.reuseIdentifier
        let expectedIdentifier = "TableViewId"
        XCTAssertEqual(actualIdentifier, expectedIdentifier)
    }
    func test_get_request_url() {
        guard let url = URL(string: Constants.baseUrl) else {
            fatalError("URL can't be empty")
        }
        client.getList(list: .listFeed) { results in}
        XCTAssert(session.lastUrl == url)
        
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
    func testNetworkData(){
        let promise = expectation(description: "Simple Request")
        let request = URLRequest(url: URL(string:Constants.baseUrl)!)
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {return}
            do{
                let _ = String.init(data: data, encoding: String.Encoding.ascii)
                
                promise.fulfill()
            }
            catch let err {
                print("error",error)
            }
        }.resume()
        waitForExpectations(timeout: 5.0, handler: nil)
       
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
