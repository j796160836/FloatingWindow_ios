//
//  AppDelegate.swift
//  FloatingWindowInApp
//
//  Created by Johnny on 2020/6/16.
//  Copyright © 2020 Johnny. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        initWindow()
        
        let vc = ViewController()
        window?.rootViewController = UINavigationController(rootViewController: vc)
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {

    }

    func applicationWillTerminate(_ application: UIApplication) {

    }

    func initWindow() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        if #available(iOS 13.0, *) {
            self.window?.backgroundColor = .systemBackground
        } else {
            self.window?.backgroundColor = UIColor.white
        }
        self.window?.makeKeyAndVisible()
    }
}

