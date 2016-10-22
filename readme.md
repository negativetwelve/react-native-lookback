# react-native-lookback

React Native wrapper for [Lookback](https://lookback.io/).


## Setup

```
npm install --save react-native-lookback
```

### iOS

#### react-native link

```
react-native link react-native-lookback
```

Unfortunately, after running the `react-native link` command, you will also need to add the Lookback pod by following the instructions in the Cocoapods section. I'm working on making `react-native link` a one-stop solution, PRs welcome!

#### Cocoapods

Add the following to your Podfile:

```
pod "Lookback"
```

Then run:

```
pod install
```

You're done! :tada:

TODO(mark): When adding `react-native-lookback` to Cocoapods and referencing `node_modules`, the package can't find the header files for Lookback itself :( If anyone knows how to fix this, I would gladly accept your PR!

#### Manual

Inside your xcode project file, right click on your "Libraries" folder and select "Add files to MyApp". Navigate to `node_modules/react-native-lookback/ios/RNLookback.xcodeproj` and add that to your project. Then select your app's project file on the sidebar, scroll down to "Linked Frameworks and Libraries" and add `libRNLookback.a` to this list.

### Android

TODO(mark): Add android support.

## Usage

```js
// Import the module:
import Lookback from 'react-native-lookback';

// Initialize using your appToken.
Lookback.setupWithAppToken(token);

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
