// SPDX-License-Identifier: GPL-2.0-or-later

import Foundation
import Testing
@testable import AndariumCore

struct FullScreenDisplayPreferenceTests {
    private func defaults() -> UserDefaults {
        let name = "FullScreenDisplayPreferenceTests.\(UUID().uuidString)"
        let defaults = UserDefaults(suiteName: name)!
        defaults.removePersistentDomain(forName: name)
        return defaults
    }

    @Test func aFreshInstallKeepsTheGuestInsideTheSafeArea() {
        #expect(!FullScreenDisplayPreference(defaults: defaults()).isOn)
    }

    @Test func whatThePersonSetsIsKept() {
        let store = defaults()
        FullScreenDisplayPreference(defaults: store).keep(true)
        #expect(FullScreenDisplayPreference(defaults: store).isOn)
        FullScreenDisplayPreference(defaults: store).keep(false)
        #expect(!FullScreenDisplayPreference(defaults: store).isOn)
    }
}
