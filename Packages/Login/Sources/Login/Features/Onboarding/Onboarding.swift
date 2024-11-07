//
//  File.swift
//  Login
//
//  Created by Muhammad Osama on 02/11/2024.
//

import Foundation
import ComposableArchitecture
import Combine

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
            case .path(_):
                return .none
            }
        }
        .forEach(\.path, action: \.path)
    }
}
