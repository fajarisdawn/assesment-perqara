//
//  AppDelegate.swift
//  assesment-perqara
//
//  Created by fajaradiwasentosa on 14/08/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let viewController = UINavigationController(rootViewController: HomeViewController())
        UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffset(horizontal: -1000.0, vertical: 0.0), for: .default)

        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
        return true
    }
}

