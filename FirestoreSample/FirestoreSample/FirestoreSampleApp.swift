//
//  FirestoreSampleApp.swift
//  FirestoreSample
//
//  Created by 岩田照太 on 2022/01/24.
//

import SwiftUI
import Firebase

@main
struct FirestoreSampleApp: App {
    
    init () {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
