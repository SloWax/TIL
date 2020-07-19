//
//  AppDelegate.swift
//  SlackNewWorkspaceUI
//
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        window?.overrideUserInterfaceStyle = .light
        window?.rootViewController = CreateNewWSViewController()
        window?.backgroundColor = .systemBackground
        window?.makeKeyAndVisible()
        
        return true
    }
}
