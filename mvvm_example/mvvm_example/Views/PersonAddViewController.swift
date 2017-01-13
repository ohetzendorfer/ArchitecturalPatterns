//
//  AddPersonViewController.swift
//  mvc_example
//
//  Created by Oliver Mastny on 31/12/2016.
//  Copyright © 2016 Oliver Mastny. All rights reserved.
//

import UIKit

class PersonAddViewController: UIViewController {
    
    @IBOutlet var firstnameTextField: UITextField!
    @IBOutlet var lastnameTextField: UITextField!
    
    @IBAction func cancelBarButtonTouched(_ sender: Any) {
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveBarButtonTouched(_ sender: Any) {
        if PersonAddViewModel.sharedInstance.addPerson(firstname: firstnameTextField.text, lastname: lastnameTextField.text) {
            navigationController?.dismiss(animated: true, completion: nil)
        }
    }
}
