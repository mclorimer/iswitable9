//
//  AppDelegate.swift
//  ImmiMeet
//
//  Created by C4Q on 7/15/17.
//  Copyright © 2017 ImmiMeet118118. All rights reserved.
//

import UIKit
import PubNub
//import ChatSDKCore
//import ChatSDKUI
//import ChatSDKCoreData
//import ChatSDKFirebaseAdapter

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, PNObjectEventListener {

    // Stores reference on PubNub client to make sure what it won't be released.
    var client: PubNub!
    var pubnubManager = PubNubManager()
    var window: UIWindow?

  var immiLabel: UILabel?
    var meetLabel: UILabel?
    var immimeetIcon: UIImageView?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
//        BInterfaceManager.shared().a = BDefaultInterfaceAdapter.init()
//        BNetworkManager.shared().a = BFirebaseNetworkAdapter.init()
//        BStorageManager.shared().a = BCoreDataManager.init()
//        
//        let loginViewController = BAppTabBarController.init(nibName: nil, bundle: nil)
//        BNetworkManager.shared().a.auth().setChallenge(BLoginViewController.init(nibName: nil, bundle: nil));
//        
//        self.window = UIWindow.init(frame: UIScreen.main.bounds)
//        self.window?.rootViewController = loginViewController;
//        self.window?.makeKeyAndVisible();
        
        // Initialize and configure PubNub client instance
        let configuration = PNConfiguration(publishKey: "pub-c-74172a25-b815-4257-b661-9497fe0c5794", subscribeKey: "sub-c-bc5063a4-692f-11e7-9aa9-02ee2ddab7fe")
        self.client = PubNub.clientWithConfiguration(configuration)
        self.client.addListener(self)
        
        // Subscribe to demo channel with presence observation
        self.client.subscribeToChannels(["ImmiMeetChannel"], withPresence: true)
        
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
        
        DataMessenger.userReceiver = mainVC as! UserReceiver
        DataMessenger.getUsers()
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
    
    // Handle new message from one of channels on which client has been subscribed.
    func client(_ client: PubNub, didReceiveMessage message: PNMessageResult) {
        
        // Handle new message stored in message.data.message
        if message.data.channel != message.data.subscription {
            
            // Message has been received on channel group stored in message.data.subscription.
        }
        else {
            
            // Message has been received on channel stored in message.data.channel.
        }
        
        pubnubManager.shared.receive(String(describing: message.data.message!))
        print("Received message: \(String(describing: message.data.message!)) on channel \(message.data.channel) " +
            "at \(message.data.timetoken)")
    }
    
    // Handle subscription status change.
    func client(_ client: PubNub, didReceive status: PNStatus) {
        
        if status.operation == .subscribeOperation {
            
            // Check whether received information about successful subscription or restore.
            if status.category == .PNConnectedCategory || status.category == .PNReconnectedCategory {
                
                let subscribeStatus: PNSubscribeStatus = status as! PNSubscribeStatus
                if subscribeStatus.category == .PNConnectedCategory {
                    
                    // This is expected for a subscribe, this means there is no error or issue whatsoever.
                    
                    // Select last object from list of channels and send message to it.
                }
                else {
                    
                    /**
                     This usually occurs if subscribe temporarily fails but reconnects. This means there was
                     an error but there is no longer any issue.
                     */
                }
            }
            else if status.category == .PNUnexpectedDisconnectCategory {
                
                /**
                 This is usually an issue with the internet connection, this is an error, handle
                 appropriately retry will be called automatically.
                 */
            }
                // Looks like some kind of issues happened while client tried to subscribe or disconnected from
                // network.
            else {
                
                let errorStatus: PNErrorStatus = status as! PNErrorStatus
                if errorStatus.category == .PNAccessDeniedCategory {
                    
                    /**
                     This means that PAM does allow this client to subscribe to this channel and channel group
                     configuration. This is another explicit error.
                     */
                }
                else {
                    
                    /**
                     More errors can be directly specified by creating explicit cases for other error categories 
                     of `PNStatusCategory` such as: `PNDecryptionErrorCategory`,  
                     `PNMalformedFilterExpressionCategory`, `PNMalformedResponseCategory`, `PNTimeoutCategory`
                     or `PNNetworkIssuesCategory`
                     */
                }
            }
        }
    }

}

