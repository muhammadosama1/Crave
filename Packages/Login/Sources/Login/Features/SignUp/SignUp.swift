//
//  File.swift
//  Login
//
//  Created by Muhammad Osama on 04/11/2024.
//

import Foundation
import ComposableArchitecture
import User
import SwiftData
import Persistence

@Reducer
struct SignUp {
    @Dependency(\.dismiss) var dismiss
    @Dependency(\.userDatabase) var userDatabase

    @ObservableState
    struct State: Equatable {
        var username: String = ""
        var password: String = ""
        var email: String = ""
        var confirmedPassword: String = ""
        var actionButtonEnabled: Bool = false
    }

    enum Action: BindableAction {
        case didSignUp
        case didTabBack
        case userSignedUp(User)
        case binding(BindingAction<State>)
    }

    var body: some ReducerOf<Self> {
        BindingReducer()
        Reduce { state, action in
            switch action {
            case .didTabBack:
                return .run { _ in await dismiss() }
            case .binding:
                if !state.username.isEmpty
                    && !state.email.isEmpty
                    && !state.password.isEmpty
                    && state.confirmedPassword == state.password {
                    state.actionButtonEnabled = true
                } else { state.actionButtonEnabled = false }
                return .none
            case .didSignUp:
                return .run { [state = state] send in
                    let email = state.email
                    let predicate = FetchDescriptor(predicate: #Predicate<UserModel> { user in
                        user.email == email
                    })
                    let users = try userDatabase.fetch(predicate)
                    guard users.isEmpty else {
                        return
                    }
                    let user = UserModel(
                        name: state.username,
                        email: state.email,
                        password: state.password
                    )
                    try userDatabase.add(user)
                    await send(.userSignedUp(user.mapping()))
                }
            case .userSignedUp(let user):
                return .none
            }
        }
    }
}
