//
//  TrackableItemView.swift
//  SSTracker
//
//  Created by TOxIC on 13/05/2025.
//

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
                GeometryReader { geo in
                    Color.clear
                        .onAppear {
                            ItemVisibilityTracker.shared.updateVisibleItem(itemId: itemId)
                        }
                        .onChange(of: geo.frame(in: .global)) { newFrame in
                            let screenHeight = getScreenHeight()
                            let isVisible = newFrame.minY < screenHeight && newFrame.maxY > 0
                            
                            if isVisible {
                                ItemVisibilityTracker.shared.updateVisibleItem(itemId: itemId)
                            }
                        }
                }
            )
    }
    
    /// Determine screen height based on platform
    private func getScreenHeight() -> CGFloat {
        #if os(iOS)
        return UIScreen.main.bounds.height
        #elseif os(macOS)
        return NSScreen.main?.frame.height ?? 0
        #else
        return 0
        #endif
    }
}
