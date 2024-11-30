//
//  File.swift
//  Core
//
//  Created by Muhammad Osama on 06/11/2024.
//

import Foundation
import SwiftData
import Dependencies

public extension DependencyValues {
    var database: Database {
        get { self[Database.self] }
        set { self[Database.self] = newValue }
    }
}

public struct Database: Sendable {
    public var modelContainer: @Sendable () throws -> ModelContainer
}

extension Database: DependencyKey {
    public static let liveValue = Self(
        modelContainer: {
            do {
                let schema = Schema([UserModel.self])
                let config = ModelConfiguration(schema: schema)
                return try ModelContainer(for: schema, configurations: config)
            } catch {
                fatalError("Failed to create container.")
            }
        }
    )
}
