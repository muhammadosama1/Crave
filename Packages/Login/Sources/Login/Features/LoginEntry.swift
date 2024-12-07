//
//  LoginEntry.swift
//  Login
//
//  Created by Muhammad Osama on 05/11/2024.
//

import SwiftUI
import ComposableArchitecture
import User

public struct LoginEntry: View {
    @Binding var userData: User?
    public init(_ user: Binding<User?>) {
        _userData = user
    }

    public var body: some View {
        OnboardingView(
            store: Store(
                initialState: Onboarding.State(),
                reducer: {
                    Onboarding()
                    Reduce { _, action in
                        guard case let .userLoged(value) = action else {
                            return .none
                        }
                        userData = value
                        return .none
                    }
                }
            )
        )
    }
}
