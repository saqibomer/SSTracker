//
//  ItemVisibilityTracker.swift
//  SSTracker
//
//  Created by TOxIC on 13/05/2025.
//

import SwiftUI

class ItemVisibilityTracker: ObservableObject {
    static let shared = ItemVisibilityTracker()

    @Published var currentVisibleItem: String? = nil

    private init() {}

    func updateVisibleItem(itemId: String) {
        currentVisibleItem = itemId
        print("Currently visible item: \(itemId)")
    }

    func clearVisibleItem(itemId: String) {
        if currentVisibleItem == itemId {
            currentVisibleItem = nil
        }
    }
}
