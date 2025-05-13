// The Swift Programming Language
// https://docs.swift.org/swift-book
import SwiftUI
import Combine

public class SSTracker: ObservableObject {
    public static let shared = SSTracker()
    @Published public var lastCapturedItem: String? = nil
    
    private var cancellables = Set<AnyCancellable>()
    
    private init() {
        NotificationCenter.default.publisher(for: UIApplication.userDidTakeScreenshotNotification)
            .sink { _ in
                self.captureScreenshot()
            }
            .store(in: &cancellables)
    }
    
    private func captureScreenshot() {
        lastCapturedItem = ItemVisibilityTracker.shared.currentVisibleItem
        print("Screenshot taken of item: \(lastCapturedItem ?? "None")")
    }
}
