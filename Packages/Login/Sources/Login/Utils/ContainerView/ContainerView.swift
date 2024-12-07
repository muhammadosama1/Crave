//
//  SwiftUIView.swift
//  Login
//
//  Created by Muhammad Osama on 02/11/2024.
//

import SwiftUI

struct ContainerView<Content: View>: View {

    @ViewBuilder var content: Content

    var body: some View {
        ZStack(alignment: .top) {
            Image(.bg)
                 .resizable()
                 .scaledToFill()
                 .frame(maxWidth: UIScreen.main.bounds.width)
                 .ignoresSafeArea(.all)
                 .overlay {
                     Color.black
                         .opacity(0.5)
                         .ignoresSafeArea(.all)
                 }

            VStack {
                Text("Welcome to Crave 👋🏻")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()

                Spacer()

                content

            }
        }
    }
}
