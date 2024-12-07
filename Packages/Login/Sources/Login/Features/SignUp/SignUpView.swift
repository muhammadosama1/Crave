//
//  SwiftUIView.swift
//  Login
//
//  Created by Muhammad Osama on 02/11/2024.
//

import SwiftUI
import CoreUI
import ComposableArchitecture

struct SignUpView: View {

    @Bindable var store: StoreOf<SignUp>

    // MARK: - Body
    var body: some View {
        ContainerView {
            VStack {
                TitleInputField(
                    title: "Username",
                    value: $store.username
                )

                TitleInputField(
                    title: "Email",
                    value: $store.email,
                    keyboardType: .email
                )

                TitleInputField(
                    title: "Password",
                    value: $store.password,
                    keyboardType: .password
                )

                TitleInputField(
                    title: "Confirmed Password",
                    value: $store.confirmedPassword,
                    keyboardType: .password
                )

                ActionButton(title: "Sign Up") {
                    store.send(.didSignUp)
                }
                .fontWeight(.semibold)
                .environment(\.isActive, store.actionButtonEnabled)

                Button {
                    store.send(.didTabBack)
                } label: {
                    Text("Back")
                }

            }
            .padding(.bottom, 50)
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
}
