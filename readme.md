# react-native-lookback

React Native wrapper for [Lookback](https://lookback.io/).


## Setup

```bash
# Yarn
yarn add react-native-lookback

OR

# NPM
npm install --save react-native-lookback
```

### iOS with react-native and Cocoapods

Run the following:

```bash
react-native link react-native-lookback
```

Then, add the following to your Podfile:

```ruby
pod "LookbackSafe", "~> 1.4.1"
```

Then run:

```bash
pod install
```

You're done! :tada:

**NOTE:** I'm working on using the podspec within this project to automatically link the LookbackSafe framework. Currently talking with the Lookback team to support this use case!

### Android

Coming soon!

## Usage

```js
// Import the module:
import Lookback from 'react-native-lookback';

// Initialize using your appToken.
Lookback.startWithAppToken(token);

// Start Recording
Lookback.startRecordingWithOptions({
  showPreview: true, // When true, will show the Lookback interface for the user to watch / upload the recording.
  cameraEnabled: true, // When true, will record the user using the front facing camera.
  microphoneEnabled: true, // When true, will record audio with the recording.
});

// Stop Recording
Lookback.stopRecording();

// Toggle Show the Feedback Bubble.
Lookback.setFeedbackBubbleVisible(true);

// Toggle shake to record.
Lookback.setShakeToRecord(true);

// Toggle the Introduction Dialogs.
Lookback.setShowIntroductionDialogs(true);

// Open the ViewController with the list of uploads pending / completed.
// NOTE: This currently is presented using the rootViewController and does not have a back / done button to close it :(
Lookback.showLookbackUploads();

// Track entering a custom view.
Lookback.enteredView('my-view');

// Track exiting a custom view.
Lookbac.exitedView('my-view');
```

If a method is missing from the official SDK, please send a PR!
