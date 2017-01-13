//
//  PersonAddViewModel.swift
//  mvvm_example
//
//  Created by Oliver Mastny on 05/01/2017.
//  Copyright © 2017 Oliver Mastny. All rights reserved.
//

import UIKit

protocol PersonAddViewModelProtocol {
    func addPerson(firstname: String?, lastname: String?) -> Bool
}

struct PersonAddViewModel: PersonAddViewModelProtocol {
    
    static let sharedInstance = PersonAddViewModel()
    
    func addPerson(firstname: String?, lastname: String?) -> Bool {
        if let firstname = firstname, let lastname = lastname, !firstname.isEmpty, !lastname.isEmpty {
            let person = Person(firstname: firstname, lastname: lastname, isCreated: NSDate())
            RealmService.sharedInstance.add(object: person)
            return true
        }
        return false
    }
}
