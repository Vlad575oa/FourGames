//
//  SimpleGameApp.swift
//  SimpleGame
//
//  Created by user on 28.03.2023.
//

import SwiftUI

@main
struct SimpleGameApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            WelcomeView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
