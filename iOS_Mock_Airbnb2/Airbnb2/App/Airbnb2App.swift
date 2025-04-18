//
//  Airbnb2App.swift
//  Airbnb2
//
//  Created by Jaewon Oh on 4/4/25.
//

import SwiftUI

@main
struct Airbnb2App: App {
    
    let authManager = AuthManager(service: MockAuthService())
    
    var body: some Scene {
        WindowGroup {
            ContentView(authManager: authManager)
        }
    }
}
