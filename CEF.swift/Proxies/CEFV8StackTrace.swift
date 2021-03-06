//
//  CEFV8StackTrace.swift
//  CEF.swift
//
//  Created by Tamas Lustyik on 2015. 08. 01..
//  Copyright © 2015. Tamas Lustyik. All rights reserved.
//

import Foundation

public extension CEFV8StackTrace {
    
    /// Returns the stack trace for the currently active context. |frame_limit| is
    /// the maximum number of frames that will be captured.
    public static func currentTraceWithLimit(frameLimit: Int) -> CEFV8StackTrace? {
        let cefTrace = cef_v8stack_trace_get_current(Int32(frameLimit))
        return CEFV8StackTrace.fromCEF(cefTrace)
    }
    
    /// Returns true if the underlying handle is valid and it can be accessed on
    /// the current thread. Do not call any other methods if this method returns
    /// false.
    public var isValid: Bool {
        return cefObject.is_valid(cefObjectPtr) != 0
    }

    /// Returns the number of stack frames.
    public var frameCount: Int {
        return Int(cefObject.get_frame_count(cefObjectPtr))
    }

    /// Returns the stack frame at the specified 0-based index.
    public func frameAtIndex(index: Int) -> CEFV8StackFrame? {
        let cefFrame = cefObject.get_frame(cefObjectPtr, Int32(index))
        return CEFV8StackFrame.fromCEF(cefFrame)
    }
    
}

