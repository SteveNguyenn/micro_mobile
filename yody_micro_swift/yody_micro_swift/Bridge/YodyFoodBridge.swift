//
//  YodyBridge.swift
//  yody_micro_mobile
//
//  Created by Steve Nguyễn on 11/03/2024.
//

import Foundation
import Flutter
import UIKit
import React

@objc(YodyFoodBridge)
class YodyFoodBridge : RCTEventEmitter {
    
   @objc public static var instance : YodyFoodBridge!

    override init() {
        super.init()
        YodyFoodBridge.instance = self
   }
  
  @objc override static func requiresMainQueueSetup() -> Bool {
    return true
  }
  
  // Reference to use main thread
  @objc func close() -> Void {
      NotificationCenter.default.post(Notification(name: Notification.Name("close")))
  }
  
  public override func supportedEvents() -> [String]! {
      return [
        "send_result"
      ]
  }
}
