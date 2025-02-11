//
//  EchoApp.swift
//  Echo
//
//  Created by Ethan Gale on 11/21/24.
//

import SwiftUI
import SwiftData

@main
struct EchoApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            MainMenuView()
        }
        .modelContainer(sharedModelContainer)
    }
}
