//
//  SwiftUIView.swift
//  FoundationKit
//
//  Created by Muhammad Osama on 02/11/2024.
//

import SwiftUI

public struct ActionButton: View {
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
                .background(Color.appPrimary)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding()
        }
    }
}
