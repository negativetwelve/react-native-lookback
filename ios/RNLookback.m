//
//  RNLookback.m
//  RNLookback
//
//  Created by Mark Miyashita on 10/11/16.
//  Copyright © 2016 Mark Miyashita. All rights reserved.
//


#import "RNLookback.h"
#import <Lookback/Lookback.h>


@implementation RNLookback

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(startWithAppToken:(NSString *)appToken) {
  [Lookback setupWithAppToken:appToken];
}

@end
