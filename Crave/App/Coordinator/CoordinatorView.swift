//
//  CoordinatorView.swift
//  Crave
//
//  Created by Muhammad Osama on 07/12/2024.
//

import SwiftUI

struct CoordinatorView: View {
    
    @StateObject var appCoordinator: AppCoordinator = .init()
    
    var body: some View {
        NavigationStack(path: $appCoordinator.path) {
            HomeView()
                .navigationDestination(for: Screen.self) {
                    appCoordinator.build($0)
                }
                .sheet(item: $appCoordinator.sheet) {
                    appCoordinator.build($0)
                }
        }
        .environmentObject(appCoordinator)
    }
}

#Preview {
    CoordinatorView()
}
