//
//  SwiftUIView.swift
//  Login
//
//  Created by Muhammad Osama on 01/11/2024.
//

import SwiftUI
import CoreUI

struct Onboarding: View {
    var body: some View {
        ContainerView {
            Text("Crave: Discover,\nCook, Savor – Your Recipe for Every Craving!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            
            ActionButton(title: "Get Started") {
                print("Action Triggered")
            }
            .fontWeight(.bold)
        }
    }
}

#Preview {
    Onboarding()
}
