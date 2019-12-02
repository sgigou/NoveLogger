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
    
    private let dateFormatter = DateFormatter()
    
    // MARK: Set up

    override func setUp() {
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "y-MM-dd HH:mm:--.---"
        
        NoveLogger.defaultLogger.logLevel = .all
    }
    
    // MARK: Tests
    
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
        var logOutput = NoveLogger.warning("A simple message")
        logOutput = replaceSecondsAndMilliSeconds(logOutput!)
        
        let expectedOutput = "\(dateFormatter.string(from: Date())) [WARNING] A simple message"
        
        XCTAssertEqual(logOutput, expectedOutput)
    }
    
    func testFormat() {
        var logOutput = NoveLogger.debug("A message with %d %@.", args: 2, "arguments")
        logOutput = replaceSecondsAndMilliSeconds(logOutput!)
        
        let expectedOutput = "\(dateFormatter.string(from: Date())) [DEBUG] A message with 2 arguments."
        
        XCTAssertEqual(logOutput, expectedOutput)
    }

    func testLogPerformance() {
        self.measure {
            NoveLogger.verbose("A message with %d %@.", args: 2, "arguments")
        }
    }
    
    // MARK: Utils
    
    func replaceSecondsAndMilliSeconds(_ string: String) -> String {
        let pattern = "(\\d{2}).\\d{3}"
        let regex = try! NSRegularExpression(pattern: pattern, options: [])
        return regex.stringByReplacingMatches(in: string, options: [], range: NSMakeRange(0, string.count), withTemplate: "--.---")
    }

}
