//
//  AddPersonViewController.swift
//  mvc_example
//
//  Created by Oliver Mastny on 31/12/2016.
//  Copyright © 2016 Oliver Mastny. All rights reserved.
//

import UIKit
import ReSwift

class PersonAddViewController: UIViewController, StoreSubscriber {
    
    @IBOutlet var firstnameTextField: UITextField!
    @IBOutlet var lastnameTextField: UITextField!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        mainStore.subscribe(self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        mainStore.unsubscribe(self)
    }
    
    func newState(state: AppState) {
        if state.personAdded {
            mainStore.dispatch(PersonAdded())
            navigationController?.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func cancelBarButtonTouched(_ sender: Any) {
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveBarButtonTouched(_ sender: Any) {
        mainStore.dispatch(AddPerson(firstname: firstnameTextField.text, lastname: lastnameTextField.text))
    }
}
