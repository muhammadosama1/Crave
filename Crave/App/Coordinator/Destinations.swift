//
//  Destinations.swift
//  Crave
//
//  Created by Muhammad Osama on 07/12/2024.
//

import Foundation
import SwiftUI

enum Screen: Identifiable, Hashable {
    case home
    case search
    case profile
    
    var id: Self { return self }
}

enum Sheet: Identifiable, Hashable {
    case updateProfile
    
    var id: Self { return self }
}
