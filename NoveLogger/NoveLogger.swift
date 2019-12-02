//
//  NoveLogger.swift
//  NoveLogger
//
//  Created by Steve Gigou on 27/11/2019.
//  Copyright © 2019 Novesoft. All rights reserved.
//

import Foundation

public class NoveLogger {
    
    /// Default logger instance, used in static functions.
    public static let defaultLogger = NoveLogger()
    
    /// Current log level
    public var logLevel = LogLevel.defaultLevel
    
    /// Log function to use
    #if DEBUG
    private let logFunction: (_ format: String) -> Void = { format in print(format) }
    private let usingNSLog = false
    #else
    private let logFunction: (_ format: String, _ args: CVarArg...) -> Void = NSLog
    private let usingNSLog = true
    #endif
    
    // MARK: Log functions
    
    public static func emptyLine() {
        defaultLogger.emptyLine()
    }
    
    /**
     Print a new line.
    */
    public func emptyLine() {
        logFunction("")
    }
    
    /**
     Logs a message with the given format and arguments at verbose level.
     - parameter format: Formatted string.
     - parameter args: Arguments list.
     - returns: The string logged out.
    */
    @discardableResult public static func verbose(_ format: String = "", args: CVarArg...) -> String? {
        return defaultLogger.log(.verbose, format: format, args: args)
    }
    
    /**
     Logs a message with the given format and arguments at verbose level.
     - parameter format: Formatted string.
     - parameter args: Arguments list.
     - returns: The string logged out.
    */
    @discardableResult public func verbose(_ format: String = "", args: CVarArg...) -> String? {
        return log(.verbose, format: format, args: args)
    }
    
    /**
     Logs a message with the given format and arguments at debug level.
     - parameter format: Formatted string.
     - parameter args: Arguments list.
     - returns: The string logged out.
    */
    @discardableResult public static func debug(_ format: String = "", args: CVarArg...) -> String? {
        return defaultLogger.log(.debug, format: format, args: args)
    }
    
    /**
     Logs a message with the given format and arguments at debug level.
     - parameter format: Formatted string.
     - parameter args: Arguments list.
     - returns: The string logged out.
    */
    @discardableResult public func debug(_ format: String = "", args: CVarArg...) -> String? {
        return log(.debug, format: format, args: args)
    }
    
    /**
     Logs a message with the given format and arguments at info level.
     - parameter format: Formatted string.
     - parameter args: Arguments list.
     - returns: The string logged out.
    */
    @discardableResult public static func info(_ format: String = "", args: CVarArg...) -> String? {
        return defaultLogger.log(.info, format: format, args: args)
    }
    
    /**
     Logs a message with the given format and arguments at info level.
     - parameter format: Formatted string.
     - parameter args: Arguments list.
     - returns: The string logged out.
    */
    @discardableResult public func info(_ format: String = "", args: CVarArg...) -> String? {
        return log(.info, format: format, args: args)
    }
    
    /**
     Logs a message with the given format and arguments at warning level.
     - parameter format: Formatted string.
     - parameter args: Arguments list.
     - returns: The string logged out.
    */
    @discardableResult public static func warning(_ format: String = "", args: CVarArg...) -> String? {
        return defaultLogger.log(.warning, format: format, args: args)
    }
    
    /**
     Logs a message with the given format and arguments at warning level.
     - parameter format: Formatted string.
     - parameter args: Arguments list.
     - returns: The string logged out.
    */
    @discardableResult public func warning(_ format: String = "", args: CVarArg...) -> String? {
        return log(.warning, format: format, args: args)
    }
    
    /**
     Logs a message with the given format and arguments at error level.
     - parameter format: Formatted string.
     - parameter args: Arguments list.
     - returns: The string logged out.
    */
    @discardableResult public static func error(_ format: String = "", args: CVarArg...) -> String? {
        return defaultLogger.log(.error, format: format, args: args)
    }
    
    /**
     Logs a message with the given format and arguments at error level.
     - parameter format: Formatted string.
     - parameter args: Arguments list.
     - returns: The string logged out.
    */
    @discardableResult public func error(_ format: String = "", args: CVarArg...) -> String? {
        return log(.error, format: format, args: args)
    }
    
    // MARK: Utils
    
    /**
     Log and return the logged message.
     - parameter level: Log level
     - parameter format: Formatted string
     - parameter args: Arguments list
     - returns: Formatted string.
     */
    @discardableResult private func log(_ level: LogLevel, format: String, args: [CVarArg]) -> String?
    {
        if level < logLevel {
            return nil
        }

        let message = String(format: format, arguments: args)

        let logMessage = "[\(LogLevel.logName(level))] \(message)"

        logFunction(logMessage)
        return logMessage
    }
    
}
