//
//  NoveLogger.swift
//  NoveLogger
//
//  Created by Steve Gigou on 27/11/2019.
//  Copyright © 2019 Novesoft. All rights reserved.
//

import Foundation

public class NoveLogger {
    
    // MARK: Log functions
    
    /**
     Logs a message. Debug level.
     - parameter message: A value conforms `Streamable`, `Printable`, `DebugPrintable`.
     */
    public static func debug(_ message: Any) {
        #if DEBUG
        debugPrint("[DEBUG] \(message)")
        #endif
    }
    
    /**
     Logs a message. Warning level.
     - parameter message: A value conforms `Streamable`, `Printable`, `DebugPrintable`.
     */
    public static func warning(_ message: Any) {
        #if DEBUG
        print("[WARNING] \(message)")
        #endif
    }
    
    /**
     Logs a message. Error level.
     - parameter message: A value conforms `Streamable`, `Printable`, `DebugPrintable`.
     */
    public static func error(_ message: Any) {
        #if DEBUG
        print("[ERROR] \(message)")
        #endif
    }
    
}
