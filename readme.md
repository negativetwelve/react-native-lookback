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

Require / import the module:

```
import Lookback from 'react-native-lookback';
```

Start Recording:

```
Lookback.startRecordingWithOptions({
  showPreview: true, // When true, will show the Lookback interface for the user to watch / upload the recording.
  cameraEnabled: true, // When true, will record the user using the front facing camera.
  microphoneEnabled: true, // When true, will record audio with the recording.
});
```

Stop Recording:

```
Lookback.stopRecording();
```

More coming soon! PRs are very welcome!
