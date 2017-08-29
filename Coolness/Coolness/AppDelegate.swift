//
//  AppDelegate.swift
//  Coolness
//
//  Created by Jonathan Lehr on 8/28/17.
//  Copyright © 2017 About Objects. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func applicationDidFinishLaunching(_ application: UIApplication) {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.yellow
        
        // TODO: TODO: set this to a subclass of UIViewController
        window?.rootViewController = CoolViewController()
        
        window?.makeKeyAndVisible()
    }
}

