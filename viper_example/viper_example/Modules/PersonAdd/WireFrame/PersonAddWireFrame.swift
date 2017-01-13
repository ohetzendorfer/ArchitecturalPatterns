//
// Created by VIPER
// Copyright (c) 2016 VIPER. All rights reserved.
//

import UIKit

class PersonAddWireFrame: PersonAddWireFrameProtocol {
    
    var personAddViewController: PersonAddViewController!
    
    init() {
        let presenter = PersonAddPresenter()
        let interactor = PersonAddInteractor()
        let dataManager = PersonAddDataManager()
        
        personAddViewController = getPersonAddViewControllerFromStoryboard()
        personAddViewController.input = presenter
        presenter.input = interactor
        presenter.output = personAddViewController
        presenter.wireFrame = self
        interactor.input = dataManager
        interactor.output = presenter
        dataManager.output = interactor
    }
    
    func show(inViewController viewController: UIViewController) {
        let navigationController = UINavigationController(rootViewController: personAddViewController)
        viewController.present(navigationController, animated: true, completion: nil)
    }
    
    func getPersonAddViewControllerFromStoryboard() -> PersonAddViewController {
        let storyboard = UIStoryboard(name: "PersonAdd", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "PersonAddViewController") as! PersonAddViewController
        return viewController
    }
}
