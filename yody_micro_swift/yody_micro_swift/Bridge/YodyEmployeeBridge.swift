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

@objc(YodyEmployeeBridge)
class YodyEmployeeBridge : RCTEventEmitter {
    
   @objc public static var instance : YodyEmployeeBridge!

   override init() {
       super.init()
       YodyEmployeeBridge.instance = self
   }
   
  @objc override static func requiresMainQueueSetup() -> Bool {
    return true
  }
    
    
  @objc(close:withRejecter:)
  func close(resolve: RCTPromiseResolveBlock, reject: RCTPromiseRejectBlock) -> Void {
        NotificationCenter.default.post(Notification(name: Notification.Name("close")))
        resolve(true)
  }
  
  //send event from swift to react native
  func send(name: String, data: Any) {
      sendEvent(withName: name, body: data)
  }
  
  @objc(update:withResolver:withRejecter:)
  func update(data: Any, resolve: RCTPromiseResolveBlock, reject: RCTPromiseRejectBlock) -> Void {
      NotificationCenter.default.post(name: Notification.Name("employee_updated"), object: nil, userInfo: data as? [String: Any])
      NotificationCenter.default.post(Notification(name: Notification.Name("close")))
  }
    
  public override func supportedEvents() -> [String]! {
      return [
          
      ]
  }
}
