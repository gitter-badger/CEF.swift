//
//  CEFRequestContext.swift
//  CEF.swift
//
//  Created by Tamas Lustyik on 2015. 07. 26..
//  Copyright © 2015. Tamas Lustyik. All rights reserved.
//

import Foundation

extension cef_request_context_t: CEFObject {
}

public class CEFRequestContext: CEFProxy<cef_request_context_t> {
    
    // private
    
    override init?(ptr: ObjectPtrType) {
        super.init(ptr: ptr)
    }
    
    static func fromCEF(ptr: ObjectPtrType) -> CEFRequestContext? {
        return CEFRequestContext(ptr: ptr)
    }
}
