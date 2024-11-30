//
//  SwiftUIView.swift
//  Login
//
//  Created by Muhammad Osama on 02/11/2024.
//

import SwiftUI

public struct TitleInputField: View {
    
    public enum FieldType {
        case password
        case email
        case `default`
    }
    
    private var title: String
    private var keyboardType: FieldType
    @Binding private var value: String
    
    public init(
        title: String,
        value: Binding<String>,
        keyboardType: FieldType = .default
    ) {
        self.title = title
        self._value = value
        self.keyboardType = keyboardType
    }
    
    public var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.callout)
                .fontWeight(.semibold)
                .padding(.horizontal, 5)
            
            fieldView(keyboardType)
                .padding()
                .background(Color.inputFieldBackground)
                .clipShape(RoundedRectangle(cornerRadius: 12))
        }
        .padding([.horizontal, .bottom])
    }
    
    @ViewBuilder
    private func fieldView(_ type: FieldType) -> some View {
        switch type {
        case .password:
            SecureField(title, text: $value)
        case .email, .default:
            TextField(title, text: $value)
                .keyboardType(type == .email ? .emailAddress : .default)
        }
    }
}

#Preview {
    TitleInputField(
        title: "title",
        value: .constant("")
    )
}
