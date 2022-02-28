//
//  FirebaseLoginSampleApp.swift
//  FirebaseLoginSample
//
//  Created by 岩田照太 on 2021/08/18.
//

import SwiftUI
import Firebase
@main
struct FirebaseLoginSampleApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
