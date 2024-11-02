//
//  SwiftUIView.swift
//  Login
//
//  Created by Muhammad Osama on 02/11/2024.
//

import SwiftUI

public struct LoginInputField: View {
    
    private var title: String
    @Binding private var value: String
    
    public init(title: String, value: Binding<String>) {
        self.title = title
        self._value = value
    }
    
    public var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.callout)
                .fontWeight(.semibold)
                .padding(.horizontal, 5)
            
            TextField(title, text: $value)
                .padding()
                .background(Color.inputFieldBackground)
                .clipShape(RoundedRectangle(cornerRadius: 12))
        }
        .padding([.horizontal, .bottom])
    }
}

#Preview {
    LoginInputField(
        title: "title",
        value: .constant("")
    )
}
