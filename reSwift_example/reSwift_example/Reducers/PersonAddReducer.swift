//
//  PersonAddReducer.swift
//  reSwift_example
//
//  Created by Oliver Mastny on 06/01/2017.
//  Copyright © 2017 Oliver Mastny. All rights reserved.
//

import ReSwift

struct PersonAddReducer: Reducer {
    typealias ReducerStateType = AppState
    
    func handleAction(action: Action, state: AppState?) -> AppState {
        
        var state = state ?? AppState()
        
        switch action {
        case let action as AddPerson:
            if let firstname = action.firstname, let lastname = action.lastname, !firstname.isEmpty, !lastname.isEmpty {
                let newPerson = Person(firstname: firstname, lastname: lastname, isCreated: NSDate())
                RealmService.sharedInstance.add(object: newPerson)
                state.personAdded = true
            }
        case _ as PersonAdded:
            state.personAdded = false
        default:
            break
        }
        
        return state
    }
}
