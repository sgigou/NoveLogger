//
//  NoveLogger.swift
//  NoveLogger
//
//  Created by Steve Gigou on 27/11/2019.
//  Copyright © 2019 Novesoft. All rights reserved.
//

import Foundation

class NoveLogger {
    
    static func debug(_ message: Any) {
        #if DEBUG
        debugPrint("[DEBUG] \(message)")
        #endif
    }
    
    static func warning(_ message: Any) {
        #if DEBUG
        print("[WARNING] \(message)")
        #endif
    }
    
    static func error(_ message: Any) {
        #if DEBUG
        print("[ERROR] \(message)")
        #endif
    }
    
}
