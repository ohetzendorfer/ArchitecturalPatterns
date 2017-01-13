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
        if let firstname = firstnameTextField.text, let lastname = lastnameTextField.text, !firstname.isEmpty, !lastname.isEmpty {
            let newPerson = Person(firstname: firstname, lastname: lastname, isCreated: NSDate())
            RealmService.sharedInstance.add(object: newPerson)
            navigationController?.dismiss(animated: true, completion: nil)
        }
    }
}
