//
//  ItemVisibilityTracker.swift
//  SSTracker
//
//  Created by TOxIC on 13/05/2025.
//

import SwiftUI

public class ItemVisibilityTracker: ObservableObject {
    public static let shared = ItemVisibilityTracker()
    
    @Published public var currentVisibleItem: String? = nil
    
    private init() {}
    
    public func updateVisibleItem(itemId: String) {
        currentVisibleItem = itemId
    }
}
