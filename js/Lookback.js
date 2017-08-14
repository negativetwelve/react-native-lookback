// Libraries
import {NativeModules, Platform} from 'react-native';
import Package from 'react-native-package';


/**
 * Package.create handles two things:
 *
 *   1. Checks that for each platform that's `enabled`, the module is installed
 *      properly. If it's not, it logs a warning.
 *   2. Guards the module on every platform that is not `enabled`. This allows
 *      the module to exist in cross-platform code without hacks to disable it.
 *
 * You can read more about `react-native-package` here:
 * https://github.com/negativetwelve/react-native-package
 */
export default Package.create({
  json: require('../package.json'),
  nativeModule: NativeModules.RNLookback,
  enabled: Platform.select({
    ios: true,
  }),
  export: (Lookback) => ({
    // Initialize
    startWithAppToken: (token) => Lookback.startWithAppToken(token),
    startRecordingWithOptions: (options) => Lookback.startRecordingWithOptions(options),
    stopRecording: () => Lookback.stopRecording(),
    getIsRecording: () => Lookback.getIsRecording(),

    // Settings
    setFeedbackBubbleVisible: (isVisible) => Lookback.setFeedbackBubbleVisible(isVisible),
    setShakeToRecord: (isEnabled) => Lookback.setShakeToRecord(isEnabled),
    setShowIntroductionDialogs: (isVisible) => Lookback.setShowIntroductionDialogs(isVisible),
    showLookbackUploads: () => Lookback.showLookbackUploads(),

    // Analytics
    enteredView: (view) => Lookback.enteredView(view),
    exitedView: (view) => Lookback.exitedView(view),
  }),
});
