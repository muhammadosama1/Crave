//
//  File.swift
//  User
//
//  Created by Muhammad Osama on 09/11/2024.
//

import Foundation
import Persistence

public struct User {
    public var name: String
    public var email: String
    public var password: String

    public init(
        name: String,
        email: String,
        password: String
    ) {
        self.name = name
        self.email = email
        self.password = password
    }
}

extension User {
    public func mapping() -> UserModel {
        UserModel(name: name, email: email, password: password)
    }

    public var toDBModel: UserModel {
        UserModel(name: name, email: email, password: password)
    }
}

extension UserModel {
    public func mapping() -> User {
        User(name: name, email: email, password: password)
    }
}
