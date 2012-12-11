# Tap for Tap Adobe Air Native Extension

Want to use Tap for Tap with Adobe Air? We got you covered on Android and iOS (+ iPhone simulator).

## Preamble
This Application Native Extension was built using Adobe Air 3.5 SDK.

### Minimum Requirements
#### Android
  - None

#### iPhone
  - An OS X machine running Lion (10.7)
  - iOS 6.0 SDK

Note that the iPhone app cannot be built on a Windows machine using the Adobe Flex 4.6 SDK.
The iOS SDK included with Adobe Flex is too old.


## Setup
If you don't have the native extension yet then head over to the [downloads page](https://github.com/tapfortap/AdobeAir/downloads).

Installing the Tap for Tap native extension is easy. This isn't an Adobe Air 
or Adobe Flash Builder tutorial so we assume that you have a Flex Mobile project
already set up and working. All you need to do is add the `tapfortap.ane` file to
your project. If you do not know how to add a native extension there is a brief
explanation below


### Flash Builder 4.6

#### Adding the Native Extension to the Project

1. Right click on your project and select properties.
2. Click `Flex Build Path` in the left hand list.
3. Click the `Native Extensions` tab
4. Click the `Add ANE...` button on the right hand side
5. Browse to where you downloaded the Tap for Tap native extenion abd select `tapfortap.ane` and open it

#### Setup Building for iOS

Remember that building for iPhone requires iOS SDK 6 (i.e. it must be built 
on a machine running at least OS X Lion 10.7)

1. Right click on your project and select properties.
2. Expand `Flex Build Packaging` on the left hand menu
3. Click on `Apple iOS` on the left hand menu
4. Check `Enable this target platform` box
5. Click on the `Digital Signature` tab and provide your `Certificate` and `Provisioning file`
6. Click on the `Native Extensions` tab
7. Check the box under the `Package` column

#### Setup Building for Android
1. Right click on your project and select properties.
2. Expand `Flex Build Packaging` on the left hand menu
3. Click on `Google Android` on the left hand menu
4. Check `Enable this target platform` box
5. Click on the `Digital Signature` tab and provide your `Certificate`
6. Click on the `Native Extensions` tab
7. Check the box under the `Package` column
8. Add the following permissions to the app.xml
  - `<uses-permission android:name="android.permission.INTERNET" />`
  - `<uses-permission android:name="android.permission.READ_PHONE_STATE" />`
  - `<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />`
  - `<uses-permission android:name="android.permission.ACCESS_WIFI_STATE" />`
  - `<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />`
10. Include the TapForTap activity in the `app.xml`
  - `<activity android:name="com.tapfortap.TapForTapActivity"/>`

### Setup building with the Command Line or Ant
1. Add the option `-extDir` givint it the path to the folder to where `tapfortap.ane` is located.

Congratulations, you are done. You should now be able to call into the Tap for Tap library
and begin displaying ads.

## API Documentation
The ActionScript API lets you create and remove Tap for Tap ad views,
interstitals and app walls and set various optional information about your users
to help us with targetting. Please make sure your privacy policy allows this
before giving us their personal information.

#### Preamble
The first thing you will need to do before using any of the Tap for Tap API's is
to get a context to the Tap for Tap native extension. The instance is implemented
as a singleton.

```javascript
// Get a reference to the Tap for Tap context
var tft: TapForTap = TapForTap.instance;
```

#### initializeWithApiKey(apiKey: String): void
This method needs to be called before you can use any of the other API calls.
This method initializes your app with the TapForTap so we can begin serving 
you ads.

Usage:

```javascript
// Get a reference to the Tap for Tap context
var tft: TapForTap = TapForTap.instance;

// Initialze with TapForTap with my API key
var apiKey: String = 'My API key from my TapForTap account';
tft.initializeWithApiKey(apiKey);
```

#### createAdView(displayAtTop: Boolean): void
Create and display an ad view banner at the top or bottom of the display.

##### Displaying Banner Ads

###### iPhone
On iOS, banner ads are 50 points tall so at lest 50 points 
must be left free at the top or bottom of the view depending on where
the ad is shown. Only one banner ad can be displayed at a time.

###### Android
On Android, banner ads are `(50 * screen.density)` pixels tall so at
lest `(50 * screen.density)` pixels must be left free at the top or bottom
of the view depending on where the ad is shown. Only one banner ad can 
be displayed at a time.

###### Notes
On both platforms, when an orientation change occurs the banner
ad should be removed and recreated.

Usage:

```javascript
// Get a reference to the Tap for Tap context
var tft: TapForTap = TapForTap.instance;

// Create an ad view banner at the bottom of the display
tft.createAdView(false);

// Create an ad view banner at the top of the display
tft.createAdView(true);

// On orientation change remove the ad and create a new ad with
// at the top
tft.removeAdView();
tft.createAdView(true);
```

#### removeAdView(): void
Removes the ad view banner from the bottom screen and stops loading ads.

Usage:

```javascript
// Get a reference to the Tap for Tap context
var tft: TapForTap = TapForTap.instance;

// Remove the ad view and stop loading ads
tft.removeAdView();
```

#### prepareInterstitial(): void
This prepares the interstial ad type. This method only needs to be called once, 
after the interstitial is shown we automatically prepare another one for you.

Usage:

```javascript
// Get a reference to the Tap for Tap context
var tft: TapForTap = TapForTap.instance;

// Prepare the insterstial ad type
tft.prepareInsterstitial();
```

#### showInterstitial(): void
This shows an interstitial ad. Remember that you must call prepareInterstital() once
before calling showInterstitial(). Afterwards you only need to call showInterstial()
to show a new interstitial ad.

Usage:

```javascript
// prepare the interstitial ad type
// Get a reference to the Tap for Tap context
var tft: TapForTap = TapForTap.instance;
tft.prepareInterstitial();

// show an interstitial ad
TapForTap.showInterstitial();

// do some neat app stuff
  .
  .
  .

// show another interstital ad (Note that we do not need to call
// prepareInterstitial() again)
tft.showInterstital();
```

#### prepareAppWall(): void
This prepares the app wall ad type. This method only needs to be called once, 
after the app wall is shown we automatically prepare another one for you.

Usage:

```javascript
// Get a reference to the Tap for Tap context
var tft: TapForTap = TapForTap.instance;

// Prepare the app wall ad type
tft.prepareAppWall();
```

#### showAppWall(): void
This shows an app wall ad. Remember that you must call prepareAppWall() once
before calling showAppWall(). Afterwards you only need to call showAppWall()
to show a new app wall ad.

Usage:

```javascript
// Get a reference to the Tap for Tap context
var tft: TapForTap = TapForTap.instance;

// tft the app wall ad type
TapForTap.prepareAppWall();

// show an interstitial ad
tft.showAppWall();

// do some different neat app stuff
  .
  .
  .

// show another app wall ad (Note that we do not need to call
// prepareAppWall() again)
tft.showwAppWall();
```

#### setYearOfBirth(yearOfBirth: int): void
Sets the user's year of birth.

Usage:

```javascript
// Get a reference to the Tap for Tap context
var tft: TapForTap = TapForTap.instance;

// Set the year of birth
tft.setYearOfBirth(1990);
```

#### setGender(gender: int): void
Set the user's gender. There are static constants provided in the TapForTap API.
  - TapForTap.GENDER_MALE
  - TapForTap.GENDER_FEMALE
  - TapForTap.GENDER_NONE

Usage:

```javascript
// Get a reference to the Tap for Tap context
var tft: TapForTap = TapForTap.instance;

// Set the gender
tft.setGender(TapForTap.GENDER_MALE);

```

#### setLocation(latitude: Number, longitude: Number): void
Sets the user's location in terms of latitiude and longitude.

Usage:

```javascript
// Get a reference to the Tap for Tap context
var tft: TapForTap = TapForTap.instance;

// Set the location
tft.setLocation(111.1, 222.2);
```

#### setUserAccountId(userAccountId: String): void
Sets the user account id. This is a custom id that can be 
set to anything.

Usage:

```javascript
// Get a reference to the Tap for Tap context
var tft: TapForTap = TapForTap.instance;

// Set the user account id
tft.setUserAccountId("the user's account Id");
```

## Support
Things don't always go according to plan. If you hit a snag somewhere and need a
hand don't hesitate to get in touch with us at
[support@tapfortap.com](mailto:support@tapfortap.com) with Adobe Air in the subject line
or on Twitter where we go by the swanky handle 
[@tapfortap](https://twitter.com/tapfortap). 

## License

Licensed under the terms of the MIT License.

Copyright &copy; 2012 Tap for Tap Promotions Inc.
========