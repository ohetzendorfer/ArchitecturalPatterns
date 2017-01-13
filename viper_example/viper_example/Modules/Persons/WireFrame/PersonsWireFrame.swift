//
// Created by VIPER
// Copyright (c) 2016 VIPER. All rights reserved.
//

import UIKit

class PersonsWireFrame: PersonsWireFrameProtocol {
    
    var personsViewController: PersonsViewController!
    var rootWireFrame: RootWireFrame
    var personAddWireFrame: PersonAddWireFrame!
    
    init(withRootWireFrame rootWireFrame: RootWireFrame) {
        self.rootWireFrame = rootWireFrame
        
        let presenter = PersonsPresenter()
        let interactor = PersonsInteractor()
        let dataManager = PersonsDataManager()
        
        personsViewController = getPersonsViewControllerFromStoryboard()
        personsViewController.input = presenter
        presenter.input = interactor
        presenter.output = personsViewController
        presenter.wireFrame = self
        interactor.input = dataManager
        interactor.output = presenter
        dataManager.output = interactor
    }
    
    func showRootViewController(inWindow window: UIWindow) {
        rootWireFrame.show(viewController: personsViewController, inWindow: window)
    }
    
    func getPersonsViewControllerFromStoryboard() -> PersonsViewController {
        let storyboard = UIStoryboard(name: "Persons", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "PersonsViewController") as! PersonsViewController
        return viewController
    }
    
    func showPersonAdd() {
        personAddWireFrame = PersonAddWireFrame()
        personAddWireFrame.show(inViewController: personsViewController)
    }
}
