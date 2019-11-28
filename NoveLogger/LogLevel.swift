//
//  LogLevel.swift
//  NoveLogger
//
//  Created by Steve Gigou on 28/11/2019.
//  Copyright © 2019 Novesoft. All rights reserved.
//

import Foundation

/**
 NoveLogger’s log level.
 - All: Log with any level will be logged out
 - Verbose: Log out string with level greate than or equal to .Verbose
 - Debug: Log out string with level greate than or equal to .Debug
 - Info: Log out string with level greate than or equal to .Info
 - Warning: Log out string with level greate than or equal to .Warning
 - Error: Log out string with level greate than or equal to .Error
 - Off: Log is turned off
*/
public enum LogLevel: Int {
    
    case all = 0
    case verbose = 1
    case debug = 2
    case info = 3
    case warning = 4
    case error = 5
    case off = 6
    
    /// Default log level
    #if DEBUG
    public static let defaultLevel = LogLevel.all
    #else
    public static let defaultLevel = LogLevel.warning
    #endif
    
    /**
     Returns the given log level’s name.
     - parameter logLevel: Level to name.
     - returns: String describing the given level, `INVALID` if a problem occured.
     */
    public static func logName(_ logLevel: LogLevel) -> String {
        switch logLevel {
        case .all: return "ALL"
        case .verbose: return "VERBOSE"
        case .debug: return "DEBUG"
        case .info: return "INFO"
        case .warning: return "WARNING"
        case .error: return "ERROR"
        default:
            assertionFailure("Invalid level")
            return "INVALID"
        }
    }
    
}

// MARK: - Operations

extension LogLevel: Comparable {}

public func <(lhs: LogLevel, rhs: LogLevel) -> Bool {
    return lhs.rawValue < rhs.rawValue
}

public func >(lhs: LogLevel, rhs: LogLevel) -> Bool {
    return lhs.rawValue > rhs.rawValue
}

public func <=(lhs: LogLevel, rhs: LogLevel) -> Bool {
    return lhs.rawValue <= rhs.rawValue
}

public func >=(lhs: LogLevel, rhs: LogLevel) -> Bool {
    return lhs.rawValue >= rhs.rawValue
}
