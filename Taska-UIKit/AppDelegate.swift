//
//  AppDelegate.swift
//  Taska-UIKit
//
//  Created by Iuri Ferreira on 31/08/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let mainViewController = ViewController()
        
        window?.rootViewController = mainViewController
        window?.makeKeyAndVisible()
        
        return true
    }
}

