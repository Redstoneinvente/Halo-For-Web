import Foundation
import AppKit
import SwiftUI

@MainActor
enum HaloNativeSnapshotRenderer {
    static func render(expanded: Bool) -> String {
        let store = AppStore()
        let state = SurfaceState()

        state.theme = store.configuration.theme
        state.layoutOverride = store.workspace.effectiveLayout
        state.dashboardWidth = CGFloat(max(420, store.configuration.theme.width))
        state.compactWidth = CGFloat(store.workspace.effectiveLayout.appearance.compactWidth)
        state.compactHeight = CGFloat(store.workspace.effectiveLayout.appearance.surface.compactHeight)
        state.physicalNotchWidth = min(190, state.compactWidth)
        state.physicalNotchHeight = min(32, state.compactHeight)
        state.screenFrame = CGRect(x: 0, y: 0, width: 1440, height: 900)
        state.viewport.size = CGSize(
            width: expanded ? max(720, state.dashboardWidth) : max(190, state.compactWidth),
            height: expanded
                ? CGFloat(store.workspace.effectiveLayout.appearance.expandedHeight + max(40, state.compactHeight))
                : state.compactHeight
        )

        if expanded {
            state.expanded = true
            state.beginExpandedPresentation()
        }

        let width = max(190, state.viewport.size.width)
        let height = max(16, state.viewport.size.height)

        let root = SurfaceView(store: store, state: state, workspace: store.workspace)
            .frame(width: width, height: height, alignment: .top)

        let hosting = NSHostingView(rootView: root)
        hosting.frame = CGRect(x: 0, y: 0, width: width, height: height)
        hosting.layoutSubtreeIfNeeded()

        // Give SwiftUI one short main-run-loop turn for layout/state propagation.
        RunLoop.main.run(until: Date().addingTimeInterval(0.05))
        hosting.layoutSubtreeIfNeeded()

        guard let rep = hosting.bitmapImageRepForCachingDisplay(in: hosting.bounds) else {
            return ""
        }

        hosting.cacheDisplay(in: hosting.bounds, to: rep)

        guard let png = rep.representation(using: .png, properties: [:]) else {
            return ""
        }

        return "data:image/png;base64," + png.base64EncodedString()
    }
}
