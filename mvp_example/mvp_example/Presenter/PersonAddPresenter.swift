//
//  PersonAddPresenter.swift
//  mvp_example
//
//  Created by Oliver Mastny on 07/01/2017.
//  Copyright © 2017 Oliver Mastny. All rights reserved.
//

import Foundation

struct PersonAddViewData {
    let firstname: String?
    let lastname: String?
}

protocol PersonAddView: NSObjectProtocol {
    func personAdded()
}

protocol PersonAddPresenterProtocol {
    func add(person: PersonAddViewData)
}

class PersonAddPresenter {
    weak fileprivate var personAddView: PersonAddView?
    
    func add(view: PersonAddView) {
        personAddView = view
    }
    
    func removeView() {
        personAddView = nil
    }
}

extension PersonAddPresenter: PersonAddPresenterProtocol {
    func add(person: PersonAddViewData) {
        if let firstname = person.firstname, let lastname = person.lastname, !firstname.isEmpty, !lastname.isEmpty {
            let newPerson = Person(firstname: firstname, lastname: lastname, isCreated: NSDate())
            RealmService.sharedInstance.add(object: newPerson)
        }
        if let personAddView = personAddView {
            personAddView.personAdded()
        }
    }
}
