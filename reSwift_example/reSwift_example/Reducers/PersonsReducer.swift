//
//  PersonsReducer.swift
//  reSwift_example
//
//  Created by Oliver Mastny on 06/01/2017.
//  Copyright © 2017 Oliver Mastny. All rights reserved.
//

import ReSwift

struct PersonsReducer: Reducer {
    typealias ReducerStateType = AppState
    
    func handleAction(action: Action, state: AppState?) -> AppState {

        var state = state ?? AppState()
        
        switch action {
        case _ as UpdateView:
            if let objects = RealmService.sharedInstance.get(objectType: Person.self), let persons = objects.toArray() as? [Person] {
                state.persons = persons
            }
        case _ as RemovePersons:
            state.persons.removeAll()
            RealmService.sharedInstance.removeAll(withObjectType: Person.self)
        default:
            break
        }
        
        return state
    }
}
