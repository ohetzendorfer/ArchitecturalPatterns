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
    
    private let presenter = PersonAddPresenter()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        presenter.add(view: self)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        presenter.removeView()
    }
    
    @IBAction func cancelBarButtonTouched(_ sender: Any) {
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveBarButtonTouched(_ sender: Any) {
        let personAddViewData = PersonAddViewData(firstname: firstnameTextField.text, lastname: lastnameTextField.text)
        presenter.add(person: personAddViewData)
    }
}

extension PersonAddViewController: PersonAddView {
    func personAdded() {
        navigationController?.dismiss(animated: true, completion: nil)
    }
}
