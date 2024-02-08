//
//  AppDelegate.swift
//  SampleCompositionalLayout
//
//  Created by Görkem Gür on 6.02.2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let onboardingViewController = MainPageViewController()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = onboardingViewController
        window?.makeKeyAndVisible()
        return true
    }

   

}

