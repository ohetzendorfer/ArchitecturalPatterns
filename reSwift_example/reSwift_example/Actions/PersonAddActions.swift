//
//  PersonAddActions.swift
//  reSwift_example
//
//  Created by Oliver Mastny on 06/01/2017.
//  Copyright © 2017 Oliver Mastny. All rights reserved.
//

import ReSwift

struct AddPerson: Action {
    static let type = "PERSON_ACTION_ADD"
    let firstname: String?
    let lastname: String?
    
    init(firstname: String?, lastname: String?) {
        self.firstname = firstname
        self.lastname = lastname
    }
}

struct PersonAdded: Action {}
