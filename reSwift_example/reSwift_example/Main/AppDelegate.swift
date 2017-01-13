//
//  AppDelegate.swift
//  reSwift_example
//
//  Created by Oliver Mastny on 06/01/2017.
//  Copyright © 2017 Oliver Mastny. All rights reserved.
//

import UIKit
import ReSwift

let mainStore = Store<AppState>(
    reducer: CombinedReducer([PersonsReducer(), PersonAddReducer()]),
    state: AppState()
)

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        return true
    }

}

