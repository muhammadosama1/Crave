//
//  Coordinator.swift
//  Crave
//
//  Created by Muhammad Osama on 07/12/2024.
//

import SwiftUI

protocol Coordinator: ObservableObject {
    var path: NavigationPath { get set }
    var sheet: Sheet? { get set }

    func push(_ screen:  Screen)
    func presentSheet(_ sheet: Sheet)
    func pop()
    func dismissSheet()
    func popToRoot()
}
