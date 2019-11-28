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
        NoveLogger.defaultLogger.logLevel = .all
    }
    
    func testNoLog() {
        NoveLogger.defaultLogger.logLevel = .off
        let log = NoveLogger.verbose("Test message")
        XCTAssertNil(log)
    }
    
    func testLowerLevel() {
        NoveLogger.defaultLogger.logLevel = .warning
        let log = NoveLogger.debug("Test message")
        XCTAssertNil(log)
    }
    
    func testSimpleMessage() {
        let logOutput = NoveLogger.warning("A simple message")
        let expectedOutput = "[WARNING] A simple message"
        XCTAssertEqual(logOutput, expectedOutput)
    }
    
    func testFormat() {
        let logOutput = NoveLogger.debug("A message with %d %@.", args: 2, "arguments")
        let expectedOutput = "[DEBUG] A message with 2 arguments."
        XCTAssertEqual(logOutput, expectedOutput)
    }

    func testLogPerformance() {
        self.measure {
            NoveLogger.verbose("A message with %d %s.", args: [2, "arguments"])
        }
    }

}
