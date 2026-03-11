//
//  iOSClub_ProjectApp.swift
//  iOSClub_Project
//
//  Created by Yacolate on 2025/11/7.
//

import SwiftUI
import SwiftData

@main
struct iOSClub_9th_ProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: DataItem.self)
        }
    }
}
