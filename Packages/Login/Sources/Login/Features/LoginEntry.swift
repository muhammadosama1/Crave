//
//  SwiftUIView.swift
//  Login
//
//  Created by Muhammad Osama on 05/11/2024.
//

import SwiftUI
import ComposableArchitecture

public struct LoginEntry: View {
    public init() {}
    public var body: some View {
        OnboardingView(
            store: Store(
                initialState: Onboarding.State(),
                reducer: {
                    Onboarding()
                }
            )
        )
    }
}
