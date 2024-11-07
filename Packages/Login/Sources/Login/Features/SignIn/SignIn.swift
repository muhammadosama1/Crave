//
//  File.swift
//  Login
//
//  Created by Muhammad Osama on 04/11/2024.
//

import Foundation
import ComposableArchitecture

@Reducer
struct SignIn {
    @ObservableState
    struct State: Equatable {
        var userName: String = ""
        var password: String = ""
    }
    
    enum Action: BindableAction {
        case binding(BindingAction<State>)
        case didSignIn
        case didSignUp
    }
    
    var body: some ReducerOf<Self> {
        BindingReducer()
        Reduce { state, action in
            return .none
        }
    }
}
