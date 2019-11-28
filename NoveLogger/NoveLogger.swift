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
    
    // MARK: Log functions
    
    /**
     Print a new line.
    */
    public func emptyLine() {
        print("")
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

        /*let message: String
        if args.count == 0 {
            message = format
        } else {
            message = String(format: format, arguments: args)
        }*/
        let message = String(format: format, arguments: args)

        let logMessage = "[\(LogLevel.logName(level))] \(message)"

        print(logMessage)
        return logMessage
    }
    
}
