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
  NSString *userId = [RCTConvert NSString:options[@"userId"]];

  BOOL cameraEnabled = [RCTConvert BOOL:options[@"cameraEnabled"]];
  BOOL microphoneEnabled = [RCTConvert BOOL:options[@"microphoneEnabled"]];
  NSString *name = [RCTConvert NSString:options[@"name"]];
  BOOL skipPreview = [RCTConvert BOOL:options[@"skipPreview"]];

  LookbackRecordingOptions *recordingOptions = [LookbackRecordingOptions new];
  recordingOptions.userIdentifier = userId;
  recordingOptions.cameraEnabled = cameraEnabled;
  recordingOptions.microphoneEnabled = microphoneEnabled;

  if (skipPreview) {
    // If skipPreview is true then we upload the recording immediately.
    recordingOptions.afterRecording = LookbackAfterRecordingUpload;
  }

  LookbackRecordingSession *session = [[Lookback sharedLookback] startRecordingWithOptions:recordingOptions];
  session.name = name;
}

RCT_EXPORT_METHOD(stopRecording) {
  [[Lookback sharedLookback] stopRecording];
}

@end
