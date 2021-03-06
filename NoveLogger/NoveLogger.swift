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
    
    /// Display date in logs
    private let dateFormatter = DateFormatter()
    
    /// Log function to use
    #if DEBUG
    private let logFunction: (_ format: String) -> Void = { format in print(format) }
    private let usingNSLog = false
    #else
    private let logFunction: (_ format: String, _ args: CVarArg...) -> Void = NSLog
    private let usingNSLog = true
    #endif
    
    // MARK: Life cycle
    
    public init() {
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "y-MM-dd HH:mm:ss.SSS"
    }
    
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
     - parameter function: Function name
     - parameter file:     File name
     - parameter line:     Line number
     - parameter args: Arguments list.
     - returns: The string logged out.
    */
    @discardableResult public static func verbose(_ format: String = "", function: String = #function, file: String = #file, line: Int = #line, args: CVarArg...) -> String? {
        return defaultLogger.log(.verbose, function: function, file: file,  line: line, format: format, args: args)
    }
    
    /**
     Logs a message with the given format and arguments at verbose level.
     - parameter format: Formatted string.
     - parameter function: Function name
     - parameter file:     File name
     - parameter line:     Line number
     - parameter args: Arguments list.
     - returns: The string logged out.
    */
    @discardableResult public func verbose(_ format: String = "", function: String = #function, file: String = #file, line: Int = #line, args: CVarArg...) -> String? {
        return log(.verbose, function: function, file: file,  line: line, format: format, args: args)
    }
    
    /**
     Logs a message with the given format and arguments at debug level.
     - parameter format: Formatted string.
     - parameter function: Function name
     - parameter file:     File name
     - parameter line:     Line number
     - parameter args: Arguments list.
     - returns: The string logged out.
    */
    @discardableResult public static func debug(_ format: String = "", function: String = #function, file: String = #file, line: Int = #line, args: CVarArg...) -> String? {
        return defaultLogger.log(.debug, function: function, file: file,  line: line, format: format, args: args)
    }
    
    /**
     Logs a message with the given format and arguments at debug level.
     - parameter format: Formatted string.
     - parameter function: Function name
     - parameter file:     File name
     - parameter line:     Line number
     - parameter args: Arguments list.
     - returns: The string logged out.
    */
    @discardableResult public func debug(_ format: String = "", function: String = #function, file: String = #file, line: Int = #line, args: CVarArg...) -> String? {
        return log(.debug, function: function, file: file,  line: line, format: format, args: args)
    }
    
    /**
     Logs a message with the given format and arguments at info level.
     - parameter format: Formatted string.
     - parameter function: Function name
     - parameter file:     File name
     - parameter line:     Line number
     - parameter args: Arguments list.
     - returns: The string logged out.
    */
    @discardableResult public static func info(_ format: String = "", function: String = #function, file: String = #file, line: Int = #line, args: CVarArg...) -> String? {
        return defaultLogger.log(.info, function: function, file: file,  line: line, format: format, args: args)
    }
    
    /**
     Logs a message with the given format and arguments at info level.
     - parameter format: Formatted string.
     - parameter function: Function name
     - parameter file:     File name
     - parameter line:     Line number
     - parameter args: Arguments list.
     - returns: The string logged out.
    */
    @discardableResult public func info(_ format: String = "", function: String = #function, file: String = #file, line: Int = #line, args: CVarArg...) -> String? {
        return log(.info, function: function, file: file,  line: line, format: format, args: args)
    }
    
    /**
     Logs a message with the given format and arguments at warning level.
     - parameter format: Formatted string.
     - parameter function: Function name
     - parameter file:     File name
     - parameter line:     Line number
     - parameter args: Arguments list.
     - returns: The string logged out.
    */
    @discardableResult public static func warning(_ format: String = "", function: String = #function, file: String = #file, line: Int = #line, args: CVarArg...) -> String? {
        return defaultLogger.log(.warning, function: function, file: file,  line: line, format: format, args: args)
    }
    
    /**
     Logs a message with the given format and arguments at warning level.
     - parameter format: Formatted string.
     - parameter function: Function name
     - parameter file:     File name
     - parameter line:     Line number
     - parameter args: Arguments list.
     - returns: The string logged out.
    */
    @discardableResult public func warning(_ format: String = "", function: String = #function, file: String = #file, line: Int = #line, args: CVarArg...) -> String? {
        return log(.warning, function: function, file: file,  line: line, format: format, args: args)
    }
    
    /**
     Logs a message with the given format and arguments at error level.
     - parameter format: Formatted string.
     - parameter function: Function name
     - parameter file:     File name
     - parameter line:     Line number
     - parameter args: Arguments list.
     - returns: The string logged out.
    */
    @discardableResult public static func error(_ format: String = "", function: String = #function, file: String = #file, line: Int = #line, args: CVarArg...) -> String? {
        return defaultLogger.log(.error, function: function, file: file,  line: line, format: format, args: args)
    }
    
    /**
     Logs a message with the given format and arguments at error level.
     - parameter format: Formatted string.
     - parameter function: Function name
     - parameter file:     File name
     - parameter line:     Line number
     - parameter args: Arguments list.
     - returns: The string logged out.
    */
    @discardableResult public func error(_ format: String = "", function: String = #function, file: String = #file, line: Int = #line, args: CVarArg...) -> String? {
        return log(.error, function: function, file: file,  line: line, format: format, args: args)
    }
    
    // MARK: Utils
    
    /**
     Log and return the logged message.
     - parameter level: Log level
     - parameter format: Formatted string
     - parameter args: Arguments list
     - returns: Formatted string.
     */
    @discardableResult private func log(_ level: LogLevel, function: String = #function, file: String = #file, line: Int = #line, format: String, args: [CVarArg]) -> String?
    {
        if level < logLevel {
            return nil
        }
        
        let dateTime = usingNSLog ? "" : "\(dateFormatter.string(from: Date()))"
        let levelName =  "[\(LogLevel.logName(level))]"
        let message = String(format: format, arguments: args)
        let path = "[\((file as NSString).lastPathComponent):\(line)] \(function)"

        let logMessage = "\(dateTime) \(levelName) \(path): \(message)"

        logFunction(logMessage)
        return logMessage
    }
    
}
