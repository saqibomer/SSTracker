//
//  TrackableItemView.swift
//  SSTracker
//
//  Created by TOxIC on 13/05/2025.
//

import SwiftUI

import SwiftUI

public struct TrackableItemView<Content: View>: View {
    let itemId: String
    let content: Content

    public init(itemId: String, @ViewBuilder content: () -> Content) {
        self.itemId = itemId
        self.content = content()
    }

    public var body: some View {
        content
            .background(
                GeometryReader { proxy in
                    Color.clear
                        .onAppear {
                            ItemVisibilityTracker.shared.updateVisibleItem(itemId: itemId)
                        }
                        .onDisappear {
                            ItemVisibilityTracker.shared.clearVisibleItem(itemId: itemId)
                        }
                }
            )
    }
}

