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
        let log = NoveLogger.verbose("Just a test")
        XCTAssertNil(log)
    }
    
    func testVerbose() {
        let verboseLog = NoveLogger.verbose("A message with %d %@.", args: 2, "arguments")
        let expectedLog = "[VERBOSE] A message with 2 arguments."
        XCTAssertEqual(verboseLog, expectedLog)
    }

    func testLogPerformance() {
        self.measure {
            NoveLogger.verbose("A message with %d %s.", args: [2, "arguments"])
        }
    }

}
