//
//  SwiftUIView.swift
//  Login
//
//  Created by Muhammad Osama on 02/11/2024.
//

import SwiftUI
import CoreUI

struct SignUpView: View {
    //MARK: - Variables
    @Binding var userName: String
    @Binding var password: String
    @Binding var email: String
    
    //MARK: - Body
    var body: some View {
        ContainerView {
            VStack {
                LoginInputField(
                    title: "Username",
                    value: $userName
                )
                
                LoginInputField(
                    title: "Email",
                    value: $email
                )
                
                LoginInputField(
                    title: "Password",
                    value: $password
                )
                
                ActionButton(title: "Sign Up") {
                    print("Action Triggered")
                }
                .fontWeight(.semibold)
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
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    SignUpView(
        userName: .constant(""),
        password: .constant(""),
        email: .constant("")
    )
}

