//
//  File.swift
//  Login
//
//  Created by Muhammad Osama on 04/11/2024.
//

import Foundation
import ComposableArchitecture
import Persistence
import SwiftData
import User

@Reducer
struct SignIn {
    @Dependency(\.userDatabase) var userDatabase
    
    @ObservableState
    struct State: Equatable {
        var email: String = ""
        var password: String = ""
        var isSignInButtonEnabled: Bool = false
    }
    
    enum Action: BindableAction {
        case binding(BindingAction<State>)
        case didSignIn
        case didSignUp
        case signInSuccess(User)
    }
    
    var body: some ReducerOf<Self> {
        BindingReducer()
        Reduce { state, action in
            switch action {
            case .didSignIn:
                return .run { [state = state] send in
                    do {
                        let email = state.email
                        let predicate = FetchDescriptor(predicate: #Predicate<UserModel> { user in
                            user.email == email
                        })
                        let user  = try userDatabase.fetch(predicate)
                        guard let user = user.first,
                              user.email == state.email,
                              user.password == state.password else { return }
                        
                        await send(.signInSuccess(user.mapping()))
                    } catch {
                        print("error")
                    }
                }
            case .didSignUp:
                return .none
            case .signInSuccess(let user):
                return .none
            case .binding:
                if !state.email.isEmpty && !state.password.isEmpty {
                    state.isSignInButtonEnabled = true
                } else { state.isSignInButtonEnabled = false }
                return .none
            }
        }
    }
}
