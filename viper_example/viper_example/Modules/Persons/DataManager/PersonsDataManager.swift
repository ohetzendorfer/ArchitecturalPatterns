//
// Created by VIPER
// Copyright (c) 2016 VIPER. All rights reserved.
//

class PersonsDataManager {
    weak var output: PersonsInteractorOutputProtocol!
}

extension PersonsDataManager: PersonsLocalDataManagerInputProtocol {
    func getPersons() {
        if let objects = RealmService.sharedInstance.get(objectType: Person.self), let persons = objects.toArray() as? [Person] {
            output.fetch(persons: persons)
        }
    }
    func removePersons() {
        RealmService.sharedInstance.removeAll(withObjectType: Person.self)
        output.personsRemoved()
    }
}
