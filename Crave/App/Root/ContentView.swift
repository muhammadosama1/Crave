//
//  ContentView.swift
//  Crave
//
//  Created by Muhammad Osama on 31/10/2024.
//

import SwiftUI
import Login

struct ContentView: View {
    @State var userData: String = ""
    var body: some View {
        LoginEntry()
    }
}

#Preview {
    ContentView(userData: "")
}
