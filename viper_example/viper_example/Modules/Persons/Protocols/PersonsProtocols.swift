//
// Created by VIPER
// Copyright (c) 2016 VIPER. All rights reserved.
//

protocol PersonsWireFrameProtocol: class {
    func getPersonsViewControllerFromStoryboard() -> PersonsViewController
    func showPersonAdd()
}

protocol PersonsViewControllerOutputProtocol: class {
    func show(persons: [Person])
    func removePersons()
}

protocol PersonsPresenterInputProtocol: class {
    func updateView()
    func showPersonAdd()
    func removePersons()
}

protocol PersonsInteractorInputProtocol: class {
    func fetchPersons()
    func removePersons()
}

protocol PersonsInteractorOutputProtocol: class {
    func fetch(persons: [Person])
    func personsRemoved()
}

protocol PersonsLocalDataManagerInputProtocol: class {
    func getPersons()
    func removePersons()
}
