//
//  AppWireframes.swift
//  viper_example
//
//  Created by Oliver Mastny on 31/12/2016.
//  Copyright © 2016 Oliver Mastny. All rights reserved.
//

import UIKit

class AppWireframes {

    var personsWireFrame: PersonsWireFrame
    
    init() {
        let rootWireframe = RootWireFrame()
        personsWireFrame = PersonsWireFrame(withRootWireFrame: rootWireframe)
    }
    
    func showRootViewController(inWindow window: UIWindow) {
        personsWireFrame.showRootViewController(inWindow: window)
    }
    
}
