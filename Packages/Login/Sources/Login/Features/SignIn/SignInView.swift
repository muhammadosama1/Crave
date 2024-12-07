//
//  SwiftUIView.swift
//  Login
//
//  Created by Muhammad Osama on 01/11/2024.
//

import SwiftUI
import CoreUI
import ComposableArchitecture

struct SignInView: View {
    @Bindable var store: StoreOf<SignIn>

    // MARK: - Body
    var body: some View {
        ContainerView {
            VStack {
                TitleInputField(
                    title: "Enter your email",
                    value: $store.email,
                    keyboardType: .email
                )

                TitleInputField(
                    title: "Enter your Password",
                    value: $store.password,
                    keyboardType: .password
                )

                VStack(spacing: 8) {
                    ActionButton(title: "Sign In") {
                        store.send(.didSignIn)
                    }
                    .fontWeight(.semibold)
                    .environment(\.isActive, store.isSignInButtonEnabled)

                    signupView
                }
                .padding(.bottom, 50)
            }
            .padding(.top, 30)
            .background(Color.white)
            .clipShape(
                UnevenRoundedRectangle(
                    topLeadingRadius: 20,
                    topTrailingRadius: 20,
                    style: .circular
                )
            )
        }
        .navigationBarHidden(true)
        .ignoresSafeArea(edges: .bottom)
    }

    // MARK: - Views
    @ViewBuilder var signupView: some View {
        Button {
            store.send(.didSignUp)
        } label: {
            HStack {
                Text("Don't have an account")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)

                Text("Sign Up")
                    .font(.subheadline)
            }
        }
    }
}

#Preview {
    SignInView(store: Store(initialState: SignIn.State(), reducer: {
        SignIn()
    }))
}
