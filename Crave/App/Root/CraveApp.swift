//
//  CraveApp.swift
//  Crave
//
//  Created by Muhammad Osama on 31/10/2024.
//

import SwiftUI
import SwiftData
import Persistence
import Dependencies

@main
struct CraveApp: App {
    @Dependency(\.database) var databsase
    
    var modelContext: ModelContext {
        guard let modelContainer = try? self.databsase.modelContainer() else {
            fatalError("Could not find modelcontext")
        }
        return modelContainer.mainContext
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContext(modelContext)
    }
}

