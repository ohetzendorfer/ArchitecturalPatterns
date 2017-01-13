//
//  PersonsViewModel.swift
//  mvvm_example
//
//  Created by Oliver Mastny on 05/01/2017.
//  Copyright © 2017 Oliver Mastny. All rights reserved.
//

protocol PersonsViewModelProtocol {
    func fetchPersons()
    func removePersons()
    func getPersonsCount() -> Int
    func getPersonFullName(withIndex index: Int) -> String
    func getPersonCreationDate(withIndex index: Int) -> String
}

class PersonsViewModel: PersonsViewModelProtocol {
    
    static let sharedInstance = PersonsViewModel()
    
    var persons = [Person]()
    
    func fetchPersons() {
        if let objects = RealmService.sharedInstance.get(objectType: Person.self), let persons = objects.toArray() as? [Person] {
            self.persons = persons
        }
    }
    
    func removePersons() {
        self.persons.removeAll()
        RealmService.sharedInstance.removeAll(withObjectType: Person.self)
    }
    
    func getPersonsCount() -> Int {
        return persons.count
    }
    
    func getPersonFullName(withIndex index: Int) -> String {
        let person = persons[index]
        return "\(person.firstname) \(person.lastname)"
    }
    
    func getPersonCreationDate(withIndex index: Int) -> String {
        let person = persons[index]
        if let date = person.isCreated {
            return date.getString(withDateFormatType: .long)
        }
        return ""
    }
}
