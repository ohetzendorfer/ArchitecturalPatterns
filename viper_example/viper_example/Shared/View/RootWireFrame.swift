//
//  RootView.swift
//  viper_example
//
//  Created by Oliver Mastny on 05/01/2017.
//  Copyright © 2017 Oliver Mastny. All rights reserved.
//

import UIKit

class RootWireFrame {
    func show(viewController: UIViewController, inWindow window: UIWindow) {
        let navigationController = window.rootViewController as! UINavigationController
        navigationController.viewControllers = [viewController]
    }
}
