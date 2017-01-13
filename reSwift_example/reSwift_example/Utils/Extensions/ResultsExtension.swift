//
//  ResultsExtension.swift
//  mvc_example
//
//  Created by Oliver Mastny on 31/12/2016.
//  Copyright © 2016 Oliver Mastny. All rights reserved.
//

import RealmSwift

extension Results {
    func toArray() -> [T] {
        return self.map{ $0 }
    }
}
