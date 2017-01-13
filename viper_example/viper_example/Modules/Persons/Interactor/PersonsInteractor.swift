//
// Created by VIPER
// Copyright (c) 2016 VIPER. All rights reserved.
//

class PersonsInteractor {
    weak var output: PersonsInteractorOutputProtocol!
    var input: PersonsLocalDataManagerInputProtocol!
}

extension PersonsInteractor: PersonsInteractorInputProtocol {
    func fetchPersons() {
        input.getPersons()
    }
    func removePersons() {
        input.removePersons()
    }
}

extension PersonsInteractor: PersonsInteractorOutputProtocol {
    func fetch(persons: [Person]) {
        output.fetch(persons: persons)
    }
    func personsRemoved() {
        output.personsRemoved()
    }
}
