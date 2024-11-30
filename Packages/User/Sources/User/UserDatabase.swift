//
//  UserDatabase.swift
//  Core
//
//  Created by Muhammad Osama on 08/11/2024.
//

import Foundation
import SwiftData
import Dependencies
import Persistence

public extension DependencyValues {
    var userDatabase: UserDatabase {
        get { self[UserDatabase.self] }
        set { self[UserDatabase.self] = newValue }
    }
}

public struct UserDatabase: Sendable {
    public var fetchAll: @Sendable () throws -> [UserModel]
    public var fetch: @Sendable (FetchDescriptor<UserModel>) throws -> [UserModel]
    public var add: @Sendable (UserModel) throws -> Void
    public var delete: @Sendable (UserModel) throws -> Void
}

extension UserDatabase: DependencyKey {
    public static let liveValue = Self(
        fetchAll: {
            do {
                @Dependency(\.database.modelContainer) var modelContainer
                let context = ModelContext(try modelContainer())
                context.autosaveEnabled = true
                let descriptor = FetchDescriptor<UserModel>(sortBy: [SortDescriptor(\.id)])
                return try context.fetch(descriptor)
            } catch {
                return []
            }
        }, fetch: { descriptor in
            do {
                @Dependency(\.database.modelContainer) var modelContainer
                let context = ModelContext(try modelContainer())
                return try context.fetch(descriptor)
            } catch {
                return []
            }
        }, add: { model in
            do {
                @Dependency(\.database.modelContainer) var modelContainer
                let context = ModelContext(try modelContainer())
                context.insert(model)
                return try context.save()
            } catch {
                print("error occurred while adding")
            }
        }, delete: { model in
            do {
                @Dependency(\.database.modelContainer) var modelContainer
                let context = ModelContext(try modelContainer())
                return context.insert(model)
            } catch {
                print("error occurred while deleting")
            }
        }
    )
}
