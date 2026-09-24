import SwiftWebUI

let opened = HaloNativeSnapshotRenderer.render(expanded: true)
let closed = HaloNativeSnapshotRenderer.render(expanded: false)

SwiftWebUI.serve(port: 1337, host: "0.0.0.0") {
    HaloWebPage(openedImage: opened, closedImage: closed)
}
