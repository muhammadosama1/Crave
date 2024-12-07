//
//  SwiftUIView.swift
//  FoundationKit
//
//  Created by Muhammad Osama on 02/11/2024.
//

import SwiftUI

public struct ActionButton: View {
    @Environment(\.isActive) var isActive
    private var title: String
    private var action: () -> Void

    public init(
        title: String,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.action = action
    }

    public var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .padding()
                .frame(maxWidth: .infinity)
                .foregroundStyle(.black)
                .font(.title3)
                .background(isActive ? Color.appPrimary : .gray.opacity(0.3))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding()
        }
        .disabled(!isActive)
    }
}
