//
// Created by VIPER
// Copyright (c) 2016 VIPER. All rights reserved.
//

import UIKit

class PersonAddViewController: UIViewController {
    
    @IBOutlet var firstnameTextField: UITextField!
    @IBOutlet var lastnameTextField: UITextField!
    
    var input: PersonAddPresenterInputProtocol!
    
    @IBAction func cancelBarButtonTouched(_ sender: Any) {
        input.cancelBarButtonToched()
    }
    
    @IBAction func saveBarButtonTouched(_ sender: Any) {
        input.add(firstname: firstnameTextField.text, lastname: lastnameTextField.text)
    }
}

extension PersonAddViewController: PersonAddViewOutputProtocol {
    func dismissViewController() {
        navigationController?.dismiss(animated: true, completion: nil)
    }
}
