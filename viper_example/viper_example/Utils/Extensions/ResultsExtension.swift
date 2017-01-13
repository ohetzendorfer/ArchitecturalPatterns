//
//  ResultsExtension.swift
//  viper_example
//
//  Created by Oliver Mastny on 02/01/2017.
//  Copyright © 2017 Oliver Mastny. All rights reserved.
//

import RealmSwift

extension Results {    
    func toArray() -> [T] {
        return self.map{ $0 }
    }
}
