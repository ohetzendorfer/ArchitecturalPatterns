//
// Created by VIPER
// Copyright (c) 2016 VIPER. All rights reserved.
//

import UIKit

protocol PersonAddWireFrameProtocol: class {
    func getPersonAddViewControllerFromStoryboard() -> PersonAddViewController
    func show(inViewController viewController: UIViewController)
}

protocol PersonAddViewOutputProtocol: class {
    func dismissViewController()
}

protocol PersonAddPresenterInputProtocol: class {
    func add(firstname: String?, lastname: String?)
    func cancelBarButtonToched()
}

protocol PersonAddInteractorInputProtocol: class {
    func add(firstname: String?, lastname: String?)
}

protocol PersonAddInteractorOutputProtocol: class {
    func personAdded()
}

protocol PersonAddLocalDataManagerInputProtocol: class {
    func add(person: Person)
}
