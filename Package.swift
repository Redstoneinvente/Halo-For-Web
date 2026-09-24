// swift-tools-version: 5.9
import PackageDescription
import Foundation

let haloWebBuild = ProcessInfo.processInfo.environment["HALO_WEB"] == "1"

let package: Package

if haloWebBuild {
    package = Package(
        name: "HaloWeb",
        platforms: [.macOS(.v13)],
        products: [
            .executable(name: "HaloWeb", targets: ["HaloWeb"])
        ],
        dependencies: [
            .package(url: "https://github.com/SwiftWebUI/SwiftWebUI.git", branch: "develop")
        ],
        targets: [
            .executableTarget(
                name: "HaloWeb",
                dependencies: [
                    .product(name: "SwiftWebUI", package: "SwiftWebUI")
                ],
                path: ".",
                sources: [
                    "Halo/Core/AppStore.swift",
                    "Halo/Core/AppStoreLicensing.swift",
                    "Halo/Core/CIActivationCoordinator.swift",
                    "Halo/Core/CIConfigurationStore.swift",
                    "Halo/Core/CIKeyboardShortcut.swift",
                    "Halo/Core/CIRuntimeRegistration.swift",
                    "Halo/Core/CITriggerRuntime.swift",
                    "Halo/Core/ExtensionContracts.swift",
                    "Halo/Core/HaloDistribution.swift",
                    "Halo/Core/HaloIntegration.swift",
                    "Halo/Core/IntegrationActionBroker.swift",
                    "Halo/Core/IntegrationActionDropTargetRegistry.swift",
                    "Halo/Core/IntegrationCIRuntime.swift",
                    "Halo/Core/IntegrationDefinition.swift",
                    "Halo/Core/IntegrationTransport.swift",
                    "Halo/Core/Models.swift",
                    "Halo/Core/PersonalizationModels.swift",
                    "Halo/Core/SurfaceModels.swift",
                    "Halo/Core/WidgetModels.swift",
                    "Halo/Core/WorkspaceModels.swift",
                    "Halo/Core/WorkspaceStore.swift",
                    "Halo/NotchEngine/DisplayClock.swift",
                    "Halo/NotchEngine/NotchBubbles.swift",
                    "Halo/NotchEngine/WindowManager.swift",
                    "Halo/Services/AudioSpectrumModels.swift",
                    "Halo/Services/AudioSpectrumProviding.swift",
                    "Halo/Services/AudioSpectrumService.swift",
                    "Halo/Services/CaptureService.swift",
                    "Halo/Services/DisabledAudioSpectrumService.swift",
                    "Halo/Services/HUDEngine.swift",
                    "Halo/Services/HaloFeedbackService.swift",
                    "Halo/Services/IntegrationShortcuts.swift",
                    "Halo/Services/Integrations.swift",
                    "Halo/Services/SafariMediaBridge.swift",
                    "Halo/Services/ShelfPreview.swift",
                    "Halo/Views/ClosedNotchView.swift",
                    "Halo/Views/CompanionSprite.swift",
                    "Halo/Views/DecorationsView.swift",
                    "Halo/Views/ModuleViews.swift",
                    "Halo/Views/PixelPetWidget.swift",
                    "Halo/Views/SurfaceView.swift",
                    "Halo/Views/VisualWorkspaceAdaptiveWidgets.swift",
                    "Halo/Views/WidgetViews.swift",
                    "WebCompat/HaloWebStubs.swift",
                    "WebCompat/HaloNativeSnapshotRenderer.swift",
                    "WebCompat/HaloWebPage.swift",
                    "WebCompat/main.swift"
                ],
                swiftSettings: [
                    .define("HALO_WEB")
                ]
            )
        ]
    )
} else {
    package = Package(
        name: "HaloCore",
        platforms: [.macOS(.v13)],
        products: [
            .library(name: "HaloCore", targets: ["HaloCore"])
        ],
        targets: [
            .target(
                name: "HaloCore",
                path: "Halo/Core",
                exclude: ["AppStore.swift", "WorkspaceStore.swift"],
                sources: [
                    "Models.swift",
                    "WorkspaceModels.swift",
                    "ExtensionContracts.swift",
                    "SurfaceModels.swift",
                    "WidgetModels.swift",
                    "PersonalizationModels.swift"
                ]
            ),
            .testTarget(
                name: "HaloCoreTests",
                dependencies: ["HaloCore"],
                path: "Tests"
            )
        ]
    )
}
