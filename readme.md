# react-native-lookback

React Native wrapper for [Lookback](https://lookback.io/).


## Setup

```
npm install --save react-native-lookback@1.0.0
```

### iOS

#### react-native link

```
react-native link react-native-lookback
```

#### Cocoapods

TODO(mark): When adding `react-native-lookback` to cooapods and referencing `node_modules`, the package can't find the header files for Lookback itself :( If anyone knows how to fix this, I would gladly accept your PR!

Add the following to your Podfile:

```
pod "Lookback"
```

#### Manual

Inside your xcode project file, right click on your "Libraries" folder and select "Add files to <app>". Navigate to `node_modules/react-native-lookback/ios/RNLookback.xcodeproj` and add that to your project. Then select your app's project file on the sidebar, scroll down to "Linked Frameworks and Libraries" and add `libRNLookback.a` to this list.

### Android

TODO(mark): Add android support.

## Usage

Require / import the module:

```
import Lookback from 'react-native-lookback';
```

Start Recording:

```
Lookback.startRecordingWithOptions({
  // Options:
  // showPreview: false, // When true, will show the Lookback interface for the user to watch / upload the recording.
  // cameraEnabled: false, // When true, will record the user using the front facing camera.
  // microphoneEnabled: false, // When true, will record audio with the recording.
});

Stop Recording:

```
Lookback.stopRecording();
```

More coming soon! PRs are very welcome!
