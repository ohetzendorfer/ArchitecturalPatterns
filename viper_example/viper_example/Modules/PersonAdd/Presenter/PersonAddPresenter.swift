//
// Created by VIPER
// Copyright (c) 2016 VIPER. All rights reserved.
//

import UIKit

class PersonAddPresenter {
    weak var output: PersonAddViewOutputProtocol!
    var input: PersonAddInteractorInputProtocol!
    var wireFrame: PersonAddWireFrameProtocol!
}

extension PersonAddPresenter: PersonAddPresenterInputProtocol {
    func add(firstname: String?, lastname: String?) {
        input.add(firstname: firstname, lastname: lastname)
    }
    
    func cancelBarButtonToched() {
        output.dismissViewController()
    }
}

extension PersonAddPresenter: PersonAddInteractorOutputProtocol {
    func personAdded() {
        output.dismissViewController()
    }
}
