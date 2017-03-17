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

RCT_EXPORT_METHOD(setFeedbackBubbleVisible:(BOOL *)feedbackBubbleVisible) {
  [Lookback sharedLookback].feedbackBubbleVisible = feedbackBubbleVisible;
}

RCT_EXPORT_METHOD(setShakeToRecord:(BOOL *)shakeToRecord) {
  [Lookback sharedLookback].shakeToRecord = shakeToRecord;
}

RCT_EXPORT_METHOD(setShowIntroductionDialogs:(BOOL *)showIntroductionDialogs) {
  [Lookback sharedLookback].showIntroductionDialogs = showIntroductionDialogs;
}

RCT_EXPORT_METHOD(startRecordingWithOptions:(NSDictionary *)options) {
  BOOL cameraEnabled = [RCTConvert BOOL:options[@"cameraEnabled"]];
  BOOL microphoneEnabled = [RCTConvert BOOL:options[@"microphoneEnabled"]];
  NSString *name = [RCTConvert NSString:options[@"name"]];
  BOOL skipPreview = [RCTConvert BOOL:options[@"skipPreview"]];

  NSString *userIdentifier = options[@"userIdentifier"];

  // Coerce the userIdentifier to a string (if it was passed in as a number).
  if ([userIdentifier isKindOfClass:[NSNumber class]]) {
    userIdentifier = [(NSNumber *)userIdentifier stringValue];
  }

  LookbackRecordingOptions *recordingOptions = [LookbackRecordingOptions new];
  recordingOptions.cameraEnabled = cameraEnabled;
  recordingOptions.microphoneEnabled = microphoneEnabled;
  recordingOptions.userIdentifier = userIdentifier;

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

// NOTE(mark): This currently doesn't have a nice way of closing it. Need to add a done / back button to the view itself.
RCT_EXPORT_METHOD(showLookbackUploads) {
  UIViewController *recordings = [LookbackRecordingsTableViewController recordingsViewController];
  UIViewController *rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;

  [rootViewController presentViewController:recordings animated:YES completion:NULL];
}

RCT_EXPORT_METHOD(enteredView:(NSString *)view) {
  [[Lookback sharedLookback] enteredView:view];
}

RCT_EXPORT_METHOD(exitedView:(NSString *)view) {
  [[Lookback sharedLookback] exitedView:view];
}

// check if lookback is recording
RCT_REMAP_METHOD(getIsRecording, resolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject) {
  resolve([NSNumber numberWithBool:[[Lookback sharedLookback] isRecording]]);
}

@end
