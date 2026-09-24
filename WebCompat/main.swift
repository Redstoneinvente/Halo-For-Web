import SwiftWebUI

let snapshots = MainActor.assumeIsolated {
    (
        opened: HaloNativeSnapshotRenderer.render(expanded: true),
        closed: HaloNativeSnapshotRenderer.render(expanded: false)
    )
}

SwiftWebUI.serve(port: 1337, host: "0.0.0.0") {
    HaloWebPage(openedImage: snapshots.opened, closedImage: snapshots.closed)
}
