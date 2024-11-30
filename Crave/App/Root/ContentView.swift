//
//  ContentView.swift
//  Crave
//
//  Created by Muhammad Osama on 31/10/2024.
//

import SwiftUI
import Login
import User

struct ContentView: View {
    @State var userData: User?
    
    var body: some View {
        if userData != nil {
            Text("Logged in")
        } else {
            LoginEntry($userData)
        }
    }
}

#Preview {
    ContentView()
}
