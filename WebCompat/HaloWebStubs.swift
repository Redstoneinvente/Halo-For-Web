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


/// Web host only. The native app owns these keys in HaloApp.swift; the web host
/// does not compile the application lifecycle file.
enum HaloHUDKeys {
    static let enabled = "HaloHUDEnabled"
    static let replaceVolume = "HaloHUDReplaceVolume"
    static let replaceBrightness = "HaloHUDReplaceBrightness"
    static let replaceKeyboardBrightness = "HaloHUDReplaceKeyboardBrightness"
    static let volumeHUD = "HaloHUDVolumeEnabled"
    static let muteHUD = "HaloHUDMuteEnabled"
    static let brightnessHUD = "HaloHUDBrightnessEnabled"
    static let keyboardBrightnessHUD = "HaloHUDKeyboardBrightnessEnabled"
    static let layout = "HaloHUDLayout"
    static let position = "HaloHUDPosition"
    static let progress = "HaloHUDProgressStyle"
    static let background = "HaloHUDBackgroundStyle"
    static let width = "HaloHUDWidth"
    static let height = "HaloHUDHeight"
    static let padding = "HaloHUDPadding"
    static let corner = "HaloHUDCornerRadius"
    static let iconSize = "HaloHUDIconSize"
    static let valueSize = "HaloHUDValueSize"
    static let opacity = "HaloHUDBackgroundOpacity"
    static let accentHue = "HaloHUDAccentHue"
    static let saturation = "HaloHUDAccentSaturation"
    static let brightness = "HaloHUDAccentBrightness"
    static let dynamicAccent = "HaloHUDDynamicAccent"
    static let showIcon = "HaloHUDShowIcon"
    static let showLabel = "HaloHUDShowLabel"
    static let showValue = "HaloHUDShowValue"
    static let showProgress = "HaloHUDShowProgress"
    static let segments = "HaloHUDSegments"
    static let timeout = "HaloHUDTimeout"
    static let shadow = "HaloHUDShadow"
    static let offsetX = "HaloHUDOffsetX"
    static let offsetY = "HaloHUDOffsetY"
    static let volumeStep = "HaloHUDVolumeStep"
    static let brightnessStep = "HaloHUDBrightnessStep"
    static let keyboardStep = "HaloHUDKeyboardBrightnessStep"
}
