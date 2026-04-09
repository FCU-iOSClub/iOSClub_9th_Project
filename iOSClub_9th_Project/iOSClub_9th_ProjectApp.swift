//
//  iOSClub_ProjectApp.swift
//  iOSClub_Project
//
//  Created by Yacolate on 2025/11/7.
//

import SwiftUI
import SwiftData
import FirebaseCore
import SwiftData

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct YourApp: App {
  // register app delegate for Firebase setup
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate


  var body: some Scene {
    WindowGroup {
      NavigationView {
        ContentView()
              .modelContainer(for: DataItem.self)
      }
    }
  }
}
