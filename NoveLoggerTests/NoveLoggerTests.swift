//
//  NoveLoggerTests.swift
//  NoveLoggerTests
//
//  Created by Steve Gigou on 27/11/2019.
//  Copyright © 2019 Novesoft. All rights reserved.
//

import XCTest
@testable import NoveLogger

class NoveLoggerTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLogPerformance() {
        self.measure {
            NoveLogger.debug("A standard message")
        }
    }

}
