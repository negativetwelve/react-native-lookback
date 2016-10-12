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

- (dispatch_queue_t)methodQueue {
  return dispatch_get_main_queue();
}

RCT_EXPORT_METHOD(startWithAppToken:(NSString *)appToken) {
  [Lookback setupWithAppToken:appToken];
}

RCT_EXPORT_METHOD(startRecordingWithOptions:(NSDictionary *)options) {
  NSLog(@"startRecording with %@", options);

  NSString *userId = [RCTConvert NSString:options[@"userId"]];
  BOOL microphoneEnabled = [RCTConvert BOOL:options[@"microphoneEnabled"]];

  LookbackRecordingOptions *recordingOptions = [LookbackRecordingOptions init];
  recordingOptions.userIdentifier = userId;
  recordingOptions.microphoneEnabled = microphoneEnabled;

  [[Lookback sharedLookback] startRecordingWithOptions:recordingOptions];
}

RCT_EXPORT_METHOD(stopRecording) {
  [[Lookback sharedLookback] stopRecording];
}

@end
