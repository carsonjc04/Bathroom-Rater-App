//
//  titanrest_finalApp.swift
//  titanrest-final
//
//  Created by Nathan Chamorro on 12/12/24.
//

import SwiftUI

@main
struct titanrest_finalApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
