//
//  File.swift
//  Login
//
//  Created by Muhammad Osama on 04/11/2024.
//

import Foundation
import ComposableArchitecture

@Reducer
struct SignUp {
    @Dependency(\.dismiss) var dismiss
    
    @ObservableState
    struct State: Equatable {
        var username: String = ""
        var password: String = ""
        var email: String = ""
    }
    
    enum Action: BindableAction {
        case didChangeUsername
        case didChangePassword
        case didChangeEmail
        case didSignUp
        case didTabBack
        case binding(BindingAction<State>)
    }
    
    var body: some ReducerOf<Self> {
        BindingReducer()
        Reduce { state, action in
            switch action {
            case .didTabBack:
                return .run { _ in await dismiss() }
            default: return .none
            }
        }
    }
}
