//
//  CEFDragHandler.swift
//  CEF.swift
//
//  Created by Tamas Lustyik on 2015. 08. 11..
//  Copyright © 2015. Tamas Lustyik. All rights reserved.
//

import Foundation

public enum CEFOnDragEnterAction {
    /// Perform the default drag handling behavior
    case Accept
    
    /// Cancel the drag event
    case Cancel
}

extension CEFOnDragEnterAction: BooleanType {
    public var boolValue: Bool { return self == .Cancel }
}

/// Implement this interface to handle events related to dragging. The methods of
/// this class will be called on the UI thread.
public protocol CEFDragHandler {
    
    /// Called when an external drag event enters the browser window. |dragData|
    /// contains the drag event data and |mask| represents the type of drag
    /// operation. Return false for default drag handling behavior or true to
    /// cancel the drag event.
    func onDragEnter(browser: CEFBrowser,
                     dragData: CEFDragData,
                     operationMask: CEFDragOperationsMask) -> CEFOnDragEnterAction
    
    /// Called whenever draggable regions for the browser window change. These can
    /// be specified using the '-webkit-app-region: drag/no-drag' CSS-property. If
    /// draggable regions are never defined in a document this method will also
    /// never be called. If the last draggable region is removed from a document
    /// this method will be called with an empty vector.
    func onDraggableRegionsChanged(browser: CEFBrowser, regions: [CEFDraggableRegion])

}

public extension CEFDragHandler {
    
    func onDragEnter(browser: CEFBrowser,
                     dragData: CEFDragData,
                     operationMask: CEFDragOperationsMask) -> CEFOnDragEnterAction {
        return .Accept
    }
    
    func onDraggableRegionsChanged(browser: CEFBrowser, regions: [CEFDraggableRegion]) {
    }

}

