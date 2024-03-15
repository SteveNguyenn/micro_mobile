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
  
  @objc(close:withRejecter:)
  func close(resolve: RCTPromiseResolveBlock, reject: RCTPromiseRejectBlock) -> Void {
      NotificationCenter.default.post(Notification(name: Notification.Name("close")))
  }
    
  @objc(update:withResolver:withRejecter:)
  func update(data: Any, resolve: RCTPromiseResolveBlock, reject: RCTPromiseRejectBlock) -> Void {
      NotificationCenter.default.post(name: Notification.Name("food_updated"), object: nil, userInfo: data as? [String: Any])
      NotificationCenter.default.post(Notification(name: Notification.Name("close")))
  }
  
  public override func supportedEvents() -> [String]! {
      return [
        
      ]
  }
}
