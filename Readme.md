# Tap for Tap Adobe Air Native Extension

For more information about Tap for Tap visit [http://www.tapfortap.com](http://www.tapfortap.com)

For documentation on how to use the AdobeAir plugin visit the [Tap for Tap documentation portal](http://tapfortap.com/documentation/AdobeAir).

# Adobe Air Build Instructions
1. Install the Adobe Air SDK
2. Install the Adobe Flex SDK
3. Set the following environment variables:
  - For Android
      - `ANDROID_SDK="PATH TO ANDROID SDK"` (ie. `/usr/local/android/`)
      - `ANDROID_TARGET="ANDROID TARGET SDK"` (ie. `17`)
  - For iOS
      - `IOS_TARGET="IPHONE TARGET SDK"` (ie. `iphoneos6.1`)
  - For Air
      - `FLEX_SDK="PATH TO YOUR FLEX SDK"` (ie. `/Users/Shared/flex-sdk`)
      - `AIR_SDK="PATH TO YOUT AIR SDK"` (ie. `/Users/Shared/AdobeAIRSDK`)
4. Configure the iOS Plugin Project
  1. Open the XCode project in `tapfortap-air/native-extension/ios`
  2. Add a reference the `FlashRuntimeExtension.h` (usually found in `$FLEX_SDK/include` (If you know how to get xcodebuild to automatically include `FlashRuntimeExtension.h` let me know)
5. run `release.sh`

1.2.1 / 2012-10-07
=================
### General
- Update Android/iOS to SDK 3.x
- Add setAutoScale method to stop Android from scaling banners ads based on the screen density

1.1.0 / 2013-07-09
==================
### Android
- AdobeAir is now on par with native SDK
- Update TapForTap.jar to 2.3.0
- Add events for all ad units
- AdView can now be positioned more finely

### iOS
- AdobeAir is now on par with native SDK
- Update libTapForTap.a to 2.3.2
- Add events for all ad units
- AdView can now be positioned more finely

1.0.0 / 2013-03-05
==================
### Android
- Update TapForTap.jar to 2.2.0

### iOS
- Update libTapForTap.a to 2.2.0
