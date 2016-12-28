//
//  RNKissmetrics.m
//  RNKissmetrics
//
//  Created by Kfir Golan on 28/12/2016.
//  Copyright © 2016 Kfir Golan. All rights reserved.
//

#import "RNKissmetrics.h"

#import "RCTLog.h"
#import "RCTBridge.h"
#import "RCTConvert.h"
#import "RCTUtils.h"

#import <KISSmetricsSDK/KISSmetricsAPI.h>

@implementation RNKissmetrics

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(log:(NSString *)message)
{
    RCTLogInfo(@"RNKissmetricsLog:: %@", message);
}

RCT_EXPORT_METHOD(configure:(NSDictionary *)config)
{
//    RCTLogError(@"RNKissmetrics:: implement me! %@", NSStringFromSelector(_cmd));
    NSString *key = [RCTConvert NSString:config[@"apiKey"]];
    [KISSmetricsAPI sharedAPIWithKey:key];
    if ([RCTConvert BOOL:config[@"autoRecordInstalls"]]) {
        [[KISSmetricsAPI sharedAPI] autoRecordInstalls];
    }
    if ([RCTConvert BOOL:config[@"autoSetAppProperties"]]) {
        [[KISSmetricsAPI sharedAPI] autoSetAppProperties];
    }
    if ([RCTConvert BOOL:config[@"autoSetHardwareProperties"]]) {
        [[KISSmetricsAPI sharedAPI] autoSetHardwareProperties];
    }
}

// identify
RCT_EXPORT_METHOD(identify:(NSString *)identity)
{
//    RCTLogError(@"RNKissmetrics:: implement me! %@", NSStringFromSelector(_cmd));
    [[KISSmetricsAPI sharedAPI] identify:identity];
}

// identity
RCT_EXPORT_METHOD(identity resolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject)
{
//    RCTLogError(@"RNKissmetrics:: implement me! %@", NSStringFromSelector(_cmd));
    NSString *currentIdentity = [[KISSmetricsAPI sharedAPI] identity];
    resolve(currentIdentity);
}

// clearIdentity
RCT_EXPORT_METHOD(clearIdentity)
{
//    RCTLogError(@"RNKissmetrics:: implement me! %@", NSStringFromSelector(_cmd));
    [[KISSmetricsAPI sharedAPI] clearIdentity]
}


// alias
RCT_EXPORT_METHOD(alias:(NSString *)alias withIdentity:(NSString *)identity)
{
//    RCTLogError(@"RNKissmetrics:: implement me! %@", NSStringFromSelector(_cmd));
    [[KISSmetricsAPI sharedAPI] alias:alias withIdentity:identity];
}

// record
RCT_EXPORT_METHOD(record:(NSString *)eventName withProperties:(NSDictionary *)properties)
{
//    RCTLogError(@"RNKissmetrics:: implement me! %@", NSStringFromSelector(_cmd));
    [[KISSmetricsAPI sharedAPI] record:eventName withProperties:properties];
}


// set
RCT_EXPORT_METHOD(set:(NSDictionary *)properties)
{
//    RCTLogError(@"RNKissmetrics:: implement me! %@", NSStringFromSelector(_cmd));
    [[KISSmetricsAPI sharedAPI] set:properties];
}


@end
