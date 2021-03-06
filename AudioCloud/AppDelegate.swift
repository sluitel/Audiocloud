//
//  AppDelegate.swift
//  AudioCloud
//
//  Created by Subash Luitel on 3/16/17.
//  Copyright © 2017 Luitel Inc. All rights reserved.
//

import UIKit
import Parse
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let configuration = ParseClientConfiguration { (config) in
            config.applicationId = "noKtiTI99kSw2nMVTMoac8t4Qlls0KgTA4dBGaxL"
            config.clientKey = "GgbcfMBRGTQYsDgLgk2BOUum9DR5FBvpTUhG9ylu"
            config.server = "https://parseapi.back4app.com/"
        }
        Parse.initialize(with: configuration)
        
        // Use Firebase library to configure APIs
        FIRApp.configure()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

