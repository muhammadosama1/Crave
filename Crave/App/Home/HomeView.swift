//
//  HomeView.swift
//  Crave
//
//  Created by Muhammad Osama on 07/12/2024.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var appCoordinator: AppCoordinator
    
    var body: some View {
        VStack {
            Text("Hello, World!")
            
            Button("Go to Settings") {
                appCoordinator.push(.profile)
            }
        }
    }
}

#Preview {
    HomeView()
}
