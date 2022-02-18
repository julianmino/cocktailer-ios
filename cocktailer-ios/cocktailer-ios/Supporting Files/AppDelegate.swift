//
//  AppDelegate.swift
//  cocktailer-ios
//
//  Created by Julian Miño on 18/02/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
                window?.rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
                window?.makeKeyAndVisible()

                return true
        return true
    }

}

