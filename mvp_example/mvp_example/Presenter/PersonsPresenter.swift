//
//  PersonsPresenter.swift
//  mvp_example
//
//  Created by Oliver Mastny on 07/01/2017.
//  Copyright © 2017 Oliver Mastny. All rights reserved.
//

import Foundation

struct PersonViewData {
    let name: String
    let isCreated: String?
}

protocol PersonsView: NSObjectProtocol {
    func updateView(personsViewData: [PersonViewData])
    func personsRemoved()
}

protocol PersonsPresenterProtocol {
    func updateView()
    func removePersons()
}

class PersonsPresenter {
    weak fileprivate var personsView: PersonsView?
    
    func add(view: PersonsView) {
        personsView = view
    }
    
    func removeView() {
        personsView = nil
    }
}

extension PersonsPresenter: PersonsPresenterProtocol {
    func updateView() {
        if let objects = RealmService.sharedInstance.get(objectType: Person.self), let persons = objects.toArray() as? [Person] {
            var personsViewData = [PersonViewData]()
            for person in persons {
                let personViewData = PersonViewData(name: "\(person.firstname) \(person.lastname)", isCreated: person.isCreated?.getString(withDateFormatType: .long))
                personsViewData.append(personViewData)
            }
            if let personsView = personsView {
                personsView.updateView(personsViewData: personsViewData)
            }
        }
    }
    
    func removePersons() {
        RealmService.sharedInstance.removeAll(withObjectType: Person.self)
        if let personsView = personsView {
            personsView.personsRemoved()
        }
    }
}
