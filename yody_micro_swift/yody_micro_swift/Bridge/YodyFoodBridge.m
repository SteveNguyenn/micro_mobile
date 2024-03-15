//
//  YodyFoodBridge.m
//  yody_micro_swift
//
//  Created by Steve Nguyễn on 12/03/2024.
//
#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(YodyFoodBridge, NSObject)

RCT_EXTERN_METHOD(close:
                  (RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
RCT_EXTERN_METHOD(update: (id)data
                  withResolver: (RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)

+ (BOOL)requiresMainQueueSetup
{
  return YES;
}

- (dispatch_queue_t)methodQueue {
    return dispatch_get_main_queue();
}

@end
