//
//  ShackleHotelBuddyApp.swift
//  ShackleHotelBuddy
//
//  Created by Shackle on 07/07/2023.
//

import SwiftUI

@main
struct ShackleHotelBuddyApp: App {
    var body: some Scene {
        WindowGroup {
            Group {
                HomeView()
            }
            .environment(\.appTheme, AppTheme())
        }
    }
}
