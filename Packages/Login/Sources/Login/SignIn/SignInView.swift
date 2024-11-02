//
//  SwiftUIView.swift
//  Login
//
//  Created by Muhammad Osama on 01/11/2024.
//

import SwiftUI
import CoreUI

struct SignInView: View {
    //MARK: - Variables
    @Binding var userName: String
    @Binding var password: String
    
    //MARK: - Body
    var body: some View {
        ContainerView {
            VStack {
                LoginInputField(
                    title: "Enter your username",
                    value: $userName
                )
                
                LoginInputField(
                    title: "Enter your Password",
                    value: $password
                )
                
                VStack(spacing: 8) {
                    ActionButton(title: "Sign In") {
                        print("Action Triggered")
                    }
                    .fontWeight(.semibold)
                    
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
        .ignoresSafeArea(edges: .bottom)
    }
    
    //MARK: - Views
    @ViewBuilder var signupView: some View {
        Button {
            print("action triggered")
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
    SignInView(
        userName: .constant(""),
        password: .constant("")
    )
}
