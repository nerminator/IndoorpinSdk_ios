//
//  AppDelegate.swift
//  SampleApp
//
//  Created by pro on 07/07/15.
//  Copyright (c) 2015 Infonomi. All rights reserved.
//

import UIKit
import IndoorpinSdk

@UIApplicationMain


class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
       
        
        // This is needed for push notifications
        application.registerUserNotificationSettings(UIUserNotificationSettings(forTypes: UIUserNotificationType.Sound | UIUserNotificationType.Alert |
            UIUserNotificationType.Badge, categories: nil
            ))
        
        
        var user : IPUser = IPUser()
        
        //user.userId = 235   Fill this if you want to track the customer with your own database customer id. If this is the case, you should set userDB tof your application to YES in CMS
        
        user.name = "Taylor"
        user.surname = "Swift"
        user.email = "taylorswift@gmail.com"
        user.profileImageUrl = "http://topnews.in/light/files/taylor-swift_6.jpg?1424841363"
        user.gender =  user.IPGENDER_FEMALE
        
        
        
        user.dateOfBirth = "1980-01-30"  // "yyyy-mm-dd"
        
        //PUT_YOUR_API_KEY_HERE  You can see your Api Key in CMS Applications page
        IndoorpinSdk.sharedInstance.initialize( "PUT_YOUR_API_KEY_HERE" , userParam: user)
        
        
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        
        // Indoorpin,  
        //    If you put the following line this app will listen iBeacon signals in the background
        //    If you do not put the following line you will be able to listen iBeacons only in Enter and Exit Refions
        //    Warning: If you put this piece of code you will receive a lot of questions from Apple Review team
        //
        UIApplication.sharedApplication().beginBackgroundTaskWithExpirationHandler({
        })
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        
        //This is needed to display pop-ups in order which are stacked in the queue when the app was in background
        IndoorpinSdk.sharedInstance.applicationDidBecomeActive()
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
    }


}

