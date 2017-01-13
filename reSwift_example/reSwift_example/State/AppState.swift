//
//  AppState.swift
//  reSwift_example
//
//  Created by Oliver Mastny on 06/01/2017.
//  Copyright © 2017 Oliver Mastny. All rights reserved.
//

import ReSwift

struct AppState: StateType {
    var persons = [Person]()
    var personAdded: Bool = false
}
