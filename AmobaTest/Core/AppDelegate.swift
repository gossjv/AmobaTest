//
//  AppDelegate.swift
//  AmobaTest
//
//  Created by Jorge Vásquez on 27/02/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    static var shared = UIApplication.shared.delegate as! AppDelegate
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

}

