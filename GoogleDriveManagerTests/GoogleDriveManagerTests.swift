//
//  GoogleDriveManagerTests.swift
//  GoogleDriveManagerTests
//
//  Created 2018/08/12.
//  Copyright © 2018年 yu2xzfmd. All rights reserved.
//

import XCTest
@testable import GoogleDriveManager

class GoogleDriveManagerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        let expectation = self.expectation(description: "CallApiDelegate")
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let api = GoogleDriveAPI()
        let token = ""
        api.getAbout(accessToken: token,results: {
            print($0)
            expectation.fulfill()
        })
        self.waitForExpectations(timeout: 10, handler: nil)
    }
    
    func testExample2() {
        let expectation = self.expectation(description: "CallApiDelegate")
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let api = GoogleDriveAPI()
        let token = ""
        let id = ""
        api.getFileList(accessToken: token, id: id,results: {
            print($0)
            expectation.fulfill()
        })
        self.waitForExpectations(timeout: 10, handler: nil)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
