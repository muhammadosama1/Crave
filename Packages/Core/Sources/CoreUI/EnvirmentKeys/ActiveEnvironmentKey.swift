//
//  File.swift
//  Core
//
//  Created by Muhammad Osama on 09/11/2024.
//

import Foundation
import SwiftUI

public struct ActiveEnvironmentKey: EnvironmentKey {
    public static let defaultValue: Bool = true
}

extension EnvironmentValues {
    public var isActive: Bool {
        get { self[ActiveEnvironmentKey.self] }
        set { self[ActiveEnvironmentKey.self] = newValue }
    }
}
