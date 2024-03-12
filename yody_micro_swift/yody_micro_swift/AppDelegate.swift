//
//  AppDelegate.swift
//  yody_micro_swift
//
//  Created by Steve Nguyễn on 12/03/2024.
//

import UIKit
import Flutter
import FlutterPluginRegistrant

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var loginEngine: FlutterEngine?
    var profileEngine: FlutterEngine?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        //load login engine
        loginEngine = FlutterEngine.init(name: "login_engine")
        profileEngine = FlutterEngine.init(name: "profile_engine")
        GeneratedPluginRegistrant.register(with: loginEngine!)
        GeneratedPluginRegistrant.register(with: profileEngine!)
        return true
    }
}

