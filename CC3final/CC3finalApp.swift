//
//  CC3finalApp.swift
//  CC3final
//
//  Created by user on 9/5/2024.
//

import SwiftUI

@main
struct CC3finalApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
