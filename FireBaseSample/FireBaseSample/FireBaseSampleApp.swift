//
//  FireBaseSampleApp.swift
//  FireBaseSample
//
//  Created by 岩田照太 on 2021/05/19.
//

import SwiftUI
import Firebase

@main
struct FireBaseSampleApp: App {
    
    init() {
        FirebaseApp.configure()
    }
 
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
