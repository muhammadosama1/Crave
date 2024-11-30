//
//  Onboarding.swift
//  Login
//
//  Created by Muhammad Osama on 02/11/2024.
//

import Foundation
import ComposableArchitecture
import Combine
import User

@Reducer
struct Onboarding {
    @Reducer(state: .equatable)
    enum Path {
        case signIn(SignIn)
        case signUp(SignUp)
    }
    
    @ObservableState
    struct State: Equatable {
        var path = StackState<Path.State>()
    }
    
    enum Action {
        case path(StackActionOf<Path>)
        case actionButtonTapped
        case userLoged(User)
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .actionButtonTapped:
                state.path.append(.signIn(SignIn.State()))
                return .none
            case let .path(.element(_, action: .signIn(.didSignUp))):
                state.path.append(.signUp(SignUp.State()))
                return .none
            case let .path(.element(_, action: .signIn(.signInSuccess(user)))),
                let .path(.element(_, action: .signUp(.userSignedUp(user)))):
                return .send(.userLoged(user))
            case .path(_):
                return .none
            case .userLoged(let user):
                return .none
            }
        }
        .forEach(\.path, action: \.path)
    }
}
