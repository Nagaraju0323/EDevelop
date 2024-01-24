//
//  EDeveloperApp.swift
//  EDeveloper
//
//  Created by Nagaraju on 24/01/24.
//

import SwiftUI

@main
struct EDeveloperApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
