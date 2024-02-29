//
//  AppDelegate.swift
//  TestingProgect
//
//  Created by Aldiyar Aitpayev on 22.02.2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow()
        window?.rootViewController = UINavigationController(rootViewController: TableViewViewController())
        window?.makeKeyAndVisible()
        return true
    }


}

