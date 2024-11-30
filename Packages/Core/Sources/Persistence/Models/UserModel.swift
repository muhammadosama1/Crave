//
//  User.swift
//  Core
//
//  Created by Muhammad Osama on 06/11/2024.
//

import Foundation
import SwiftData

@Model
public class UserModel {
    public var id: UUID = UUID()
    public var name: String
    public var email: String
    public var password: String
    
    public init(name: String, email: String, password: String) {
        self.name = name
        self.email = email
        self.password = password
    }
}
