//
//  Person.swift
//  viper_example
//
//  Created by Oliver Mastny on 31/12/2016.
//  Copyright © 2016 Oliver Mastny. All rights reserved.
//

import RealmSwift

class Person: Object {
    dynamic var firstname = ""
    dynamic var lastname = ""
    dynamic var isCreated: NSDate? = nil
    
    convenience init(firstname: String, lastname: String, isCreated created: NSDate?) {
        self.init()
        
        self.firstname = firstname
        self.lastname = lastname
        self.isCreated = created
    }
}
