//
//  AppDelegate.swift
//  ImmiMeet
//
//  Created by C4Q on 7/15/17.
//  Copyright © 2017 ImmiMeet118118. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var immiLabel: UILabel?
    var meetLabel: UILabel?
    var immimeetIcon: UIImageView?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let tabBarController = UITabBarController()
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let profileVC = mainStoryboard.instantiateViewController(withIdentifier: "Profile")
        let mainVC = mainStoryboard.instantiateViewController(withIdentifier: "Discovery")
        let chatVC = mainStoryboard.instantiateViewController(withIdentifier: "Chat")
        
        tabBarController.setViewControllers([profileVC, mainVC, chatVC], animated: true)
        
        let tabBar = tabBarController.tabBar
        
        let tabProfile = tabBar.items![0]
        tabProfile.title = "Profile"
        tabProfile.image = #imageLiteral(resourceName: "profileIcon")
        
        let tabDiscovery = tabBar.items![1]
        tabDiscovery.title = "Discovery"
        tabDiscovery.image = #imageLiteral(resourceName: "discoveryIcon")
        
        let tabChat = tabBar.items![2]
        tabChat.title = "Chat"
        tabChat.image = #imageLiteral(resourceName: "chatIcon")
        
        window?.rootViewController = tabBarController
        
        window?.makeKeyAndVisible()
        
        // animation for splash
        
        if let window = self.window {
            immiLabel = UILabel()
            meetLabel = UILabel()
            immimeetIcon = UIImageView()
            
            window.addSubview(immiLabel!)
            window.addSubview(meetLabel!)
            window.addSubview(immimeetIcon!)
            
            allowProgrammableConstraints([immiLabel!, meetLabel!, immimeetIcon!])
            
            immiLabel!.text = "IMMI"
            meetLabel!.text = "MEET"
            immimeetIcon!.image = #imageLiteral(resourceName: "immimeetIcon")
            
            immiLabel!.textColor = .blue
            meetLabel!.textColor = .blue
            
            immiLabel!.font = UIFont(name: "Futura-CondensedExtraBold", size: 60)
            meetLabel!.font = UIFont(name: "Futura-CondensedExtraBold", size: 60)
            
            _ = [
                  immiLabel!.leadingAnchor.constraint(equalTo: window.leadingAnchor)
                , immiLabel!.centerYAnchor.constraint(equalTo: window.centerYAnchor)
                , meetLabel!.trailingAnchor.constraint(equalTo: window.trailingAnchor)
                , meetLabel!.centerYAnchor.constraint(equalTo: immiLabel!.centerYAnchor)
                , immimeetIcon!.centerXAnchor.constraint(equalTo: window.centerXAnchor)
                , immimeetIcon!.widthAnchor.constraint(equalToConstant: 100)
                , immimeetIcon!.heightAnchor.constraint(equalToConstant: 100)
                , immimeetIcon!.centerYAnchor.constraint(equalTo: window.centerYAnchor)
            ].map { $0.isActive = true }
            
            UIView.animate(withDuration: 1, animations: {
                self.immiLabel!.center.x = window.frame.midX
                self.meetLabel!.center.x = -(window.frame.midX)
                self.immimeetIcon!.center.y = window.frame.midY
            }, completion: { finish in
                UIView.animate(withDuration: 1.5, animations: {
                self.immiLabel!.alpha = 0
                self.meetLabel!.alpha = 0
                self.immimeetIcon!.alpha = 0
                }, completion:  { finish in
                    self.immiLabel!.removeFromSuperview()
                    self.meetLabel!.removeFromSuperview()
                    self.immimeetIcon!.removeFromSuperview()
                })
            })
            
        }
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

