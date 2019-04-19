//
//  AppDelegate.swift
//  GDTActionSDK
//
//  Created by EyreFree on 04/19/2019.
//  Copyright (c) 2019 EyreFree. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        /*
         * 在接入广点通行为数据SDK时，请在App启动的时候调用初始化方法
         * 初始化方法调用时请传入数据源UserActionSetId和在后台看到的secretKey密钥串
         */
        GDTAction.init("1106262171", secretKey: "9be5526f281752a4fda1345fee7cbc56")
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        /*
         * 在应用启动的时候请上报GDTSDKActionNameStartApp行为
         * SDK内部会判断此次启动行为是否为激活行为并上报，开发者无需另外作判断逻辑
         */
        GDTAction.logAction(GDTSDKActionNameStartApp, actionParam: ["value" : 123])
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

