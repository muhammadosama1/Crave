//
//  OnboardingView.swift
//  Login
//
//  Created by Muhammad Osama on 01/11/2024.
//

import SwiftUI
import CoreUI
import ComposableArchitecture

struct OnboardingView: View {
    @Bindable var store: StoreOf<Onboarding>
    
    var body: some View {
        NavigationStack(path: $store.scope(state: \.path, action: \.path)) {
            ContainerView {
                Text("Crave: Discover,\nCook, Savor – Your Recipe for Every Craving!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                ActionButton(title: "Get Started") {
                    store.send(.actionButtonTapped)
                }
                .fontWeight(.bold)
            }
        } destination: { store in
            switch store.case {
            case let .signIn(store):
                SignInView(store: store)
            case let .signUp(store):
                SignUpView(store: store)
            }
        }
    }
}

#Preview {
    OnboardingView(
        store: Store(
            initialState: Onboarding.State(),
            reducer: {
                Onboarding()
            }
        )
    )
}
