//
// Created by VIPER
// Copyright (c) 2016 VIPER. All rights reserved.
//

class PersonsPresenter {
    weak var output: PersonsViewControllerOutputProtocol!
    var input: PersonsInteractorInputProtocol!
    var wireFrame: PersonsWireFrameProtocol!
}

extension PersonsPresenter: PersonsPresenterInputProtocol {
    func updateView() {
        input.fetchPersons()
    }
    func removePersons() {
        input.removePersons()
    }
    func showPersonAdd() {
        wireFrame.showPersonAdd()
    }
}

extension PersonsPresenter: PersonsInteractorOutputProtocol {
    func fetch(persons: [Person]) {
        output.show(persons: persons)
    }
    func personsRemoved() {
        output.removePersons()
    }
}
