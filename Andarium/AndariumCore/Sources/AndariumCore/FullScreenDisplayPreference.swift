// SPDX-License-Identifier: GPL-2.0-or-later

import Foundation

/// Whether the guest's display takes the whole screen (the resolution
/// sheet's "Use the full screen"), kept for the install across launches.
/// A fresh install is off: the sensor housing covers the top centre of
/// Android's screen and the home indicator lies over its foot, so the
/// whole screen is the person's choice, never the default
/// (`SessionDisplayArea`).
///
/// It is a stored value of its own, so it never rewrites the stored display
/// options (`DisplayOptions`).
public struct FullScreenDisplayPreference {
    /// The stored value's key in the defaults database.
    public static let key = "andarium.fullScreenDisplay"

    private let defaults: UserDefaults

    public init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
    }

    /// The last value kept; off until one is.
    public var isOn: Bool { defaults.bool(forKey: Self.key) }

    public func keep(_ on: Bool) {
        defaults.set(on, forKey: Self.key)
    }
}
