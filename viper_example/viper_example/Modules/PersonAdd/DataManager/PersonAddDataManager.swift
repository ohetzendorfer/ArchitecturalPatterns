//
// Created by VIPER
// Copyright (c) 2016 VIPER. All rights reserved.
//

class PersonAddDataManager {
    weak var output: PersonAddInteractorOutputProtocol!
}

extension PersonAddDataManager: PersonAddLocalDataManagerInputProtocol {
    func add(person: Person) {
        RealmService.sharedInstance.add(object: person)
        output.personAdded()
    }
}
