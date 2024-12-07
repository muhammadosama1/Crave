//
//  AppCoordinator.swift
//  Crave
//
//  Created by Muhammad Osama on 07/12/2024.
//

import Foundation
import SwiftUI

class AppCoordinator: Coordinator {
    @Published var path: NavigationPath = NavigationPath()
    @Published var sheet: Sheet?
    
    func push(_ screen: Screen) {
        path.append(screen)
    }
    
    func presentSheet(_ sheet: Sheet) {
        self.sheet = sheet
    }
    
    func pop() {
        path.removeLast()
    }
        
    func dismissSheet() {
        self.sheet = nil
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    @MainActor
    @ViewBuilder
    func build(_ screen: Screen) -> some View {
        switch screen {
        case .home:
            HomeView()
        case .search:
            EmptyView()
        case .profile:
            EmptyView()
        }
    }
    
    @ViewBuilder
    func build(_ sheet: Sheet) -> some View {
        switch sheet {
        case .updateProfile:
            EmptyView()
        }
    }
}
