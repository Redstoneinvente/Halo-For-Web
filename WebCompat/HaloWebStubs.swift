import Foundation
import Combine

/// Web host compatibility only. The native app defines this in HaloApp.swift,
/// which is deliberately not part of the web executable because it owns macOS
/// application lifecycle rather than Halo presentation.
@MainActor
final class HaloCommercialSurfaceGate: ObservableObject {
    static let shared = HaloCommercialSurfaceGate()

    @Published private(set) var isReady = true

    private init() {}

    func setReady(_ ready: Bool) {
        isReady = ready
    }
}
