//
// Created by VIPER
// Copyright (c) 2016 VIPER. All rights reserved.
//

import Foundation

class PersonAddInteractor {
    weak var output: PersonAddInteractorOutputProtocol!
    var input: PersonAddLocalDataManagerInputProtocol!
}

extension PersonAddInteractor: PersonAddInteractorInputProtocol {
    func add(firstname: String?, lastname: String?) {
        if let firstname = firstname, let lastname = lastname, !firstname.isEmpty, !lastname.isEmpty {
            let person = Person(firstname: firstname, lastname: lastname, isCreated: NSDate())
            input.add(person: person)
        }
    }
}

extension PersonAddInteractor: PersonAddInteractorOutputProtocol {
    func personAdded() {
        output.personAdded()
    }
}
