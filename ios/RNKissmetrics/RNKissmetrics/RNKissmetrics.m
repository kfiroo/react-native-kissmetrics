//
//  RNKissmetrics.m
//  RNKissmetrics
//
//  Created by Kfir Golan on 28/12/2016.
//  Copyright © 2016 Kfir Golan. All rights reserved.
//

#import "RNKissmetrics.h"

@implementation RNKissmetrics

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(log:(NSString *)message)
{
    RCTLogInfo(@"RNKissmetricsLog:: %@", message);
}

@end
