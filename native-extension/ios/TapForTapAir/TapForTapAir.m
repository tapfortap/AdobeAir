/*
 * Licensed under the MIT license
 * https://tapfortap.com/LICENSE.txt
 * Copyright (c) 2013 Tap for Tap
 */

#import "FlashRuntimeExtensions.h"

#import "TFTTapForTap.h"

#import "TapForTapAir.h"
#import "TapForTapAirEventHelper.h"

#define DEFINE_ANE_FUNCTION(fn) FREObject (fn)(FREContext freContext, void* functionData, uint32_t argc, FREObject freObjects[])
#define MAP_FUNCTION(fn, data) { (const uint8_t*)(#fn), (data), &(fn) }

#define TOP  1
#define CENTER 2
#define BOTTOM 3
#define LEFT 1
#define RIGHT 3

TFTBanner *banner = nil;
TFTInterstitial *interstitial = nil;
TFTAppWall *appWall = nil;
UIView* applicationView = nil;
UIViewController* applicationViewController = nil;

void showAd(FREContext *freContext, int32_t horiztonalAligment, int32_t verticalAlignment, int32_t xOffset, int32_t yOffset, double scale);

DEFINE_ANE_FUNCTION(initializeWithApiKey)
{
    const uint8_t* apiKeyArray = NULL;
    uint32_t length = 0;
    FREGetObjectAsUTF8(freObjects[0], &length, &apiKeyArray);
    NSString* apiKey = [NSString stringWithUTF8String:(const char *)apiKeyArray];

    [TFTTapForTap initializeWithAPIKey: apiKey];

    FREObject result = nil;
    FRENewObjectFromBool(true, &result);
    return result;
}

DEFINE_ANE_FUNCTION(removeAdView)
{
    [banner removeFromSuperview];
    [banner setDelegate: nil];
    [banner release];
    banner = nil;

    FREObject result = nil;
    FRENewObjectFromBool(true, &result);
    return result;
}

DEFINE_ANE_FUNCTION(createAdView)
{

    int32_t verticalAlignment = 0;
    int32_t horiztonalAligment = 0;

    int32_t xOffset = 0;
    int32_t yOffset = 0;
    double scale =  0;

    // Handle legacy case where boolean determined position of ad
    FREObjectType *firstParam = nil;
    FREGetObjectType(freObjects[0], firstParam);
    if(*firstParam == FRE_TYPE_BOOLEAN) {
        uint32_t displayAtTop = 0;
        FREGetObjectAsBool(freObjects[0], &displayAtTop);
        if(displayAtTop) {
            verticalAlignment = TOP;
        }
        horiztonalAligment = CENTER;
    } else {
        FREGetObjectAsInt32(freObjects[0], &verticalAlignment);
        FREGetObjectAsInt32(freObjects[1], &horiztonalAligment);
        FREGetObjectAsInt32(freObjects[2], &xOffset);
        FREGetObjectAsInt32(freObjects[3], &yOffset);
        FREGetObjectAsDouble(freObjects[4], &scale);
    }

    removeAdView(freContext, functionData, argc, freObjects);
    showAd(freContext, horiztonalAligment, verticalAlignment, xOffset, yOffset, scale);
    FREObject result = nil;
    FRENewObjectFromBool(true, &result);
    return result;
}

void showAd(FREContext *freContext, int32_t horiztonalAligment, int32_t verticalAlignment, int32_t xOffset, int32_t yOffset, double scale)
{
    CGRect rect = applicationViewController.view.bounds;
    float viewHeight = rect.size.height;
    float viewWidth = rect.size.width;

    int32_t width = (uint32_t)(320 * scale);
    int32_t height = (uint32_t)(50 * scale);

    int32_t xCoordinate = 0;
    int32_t yCoordinate = 0;
    int32_t autoResizingMask = 0;

    switch (verticalAlignment) {
        case TOP:
            yCoordinate = 0;
            autoResizingMask |= UIViewAutoresizingFlexibleBottomMargin;
            break;
        case CENTER:
            yCoordinate = (viewHeight - height) / 2;
            autoResizingMask |= UIViewAutoresizingFlexibleBottomMargin;
            autoResizingMask |= UIViewAutoresizingFlexibleTopMargin;
            break;
        case BOTTOM:
            yCoordinate = (viewHeight - height);
            autoResizingMask |= UIViewAutoresizingFlexibleTopMargin;
            break;
        default:
            yCoordinate = (viewHeight - height);
            autoResizingMask |= UIViewAutoresizingFlexibleTopMargin;
            break;
    }


    switch (horiztonalAligment) {
        case LEFT:
            xCoordinate = 0;
            autoResizingMask |= UIViewAutoresizingFlexibleRightMargin;
            break;
        case CENTER:
            xCoordinate = (viewWidth - width) / 2;
            autoResizingMask |= UIViewAutoresizingFlexibleRightMargin;
            autoResizingMask |= UIViewAutoresizingFlexibleLeftMargin;
            break;
        case RIGHT:
            xCoordinate = (viewWidth - width);
            autoResizingMask |= UIViewAutoresizingFlexibleLeftMargin;
            break;
        default:
            xCoordinate = (viewWidth - width) / 2;
            autoResizingMask |= UIViewAutoresizingFlexibleRightMargin;
            autoResizingMask |= UIViewAutoresizingFlexibleLeftMargin;
            break;
    }

    // Clamp the view
    int32_t left = xCoordinate + xOffset;
    int32_t top = yCoordinate + yOffset;

    banner = [[TFTBanner bannerWithFrame:CGRectMake(left, top, width, height) delegate:[[TFTAirBannerDelegate alloc] initWithContext: freContext]] retain];
    [applicationView addSubview: banner];
}

TFTInterstitial * getInterstitial(FREContext *freContext) {
    if (interstitial == nil) {
        interstitial = [[TFTInterstitial interstitialWithDelegate:[[TFTAirInterstitialDelegate alloc] initWithContext:freContext]] retain];
    }
    return interstitial;
}

DEFINE_ANE_FUNCTION(prepareInterstitial)
{
    [getInterstitial(freContext) load];

    FREObject result = nil;
    FRENewObjectFromBool(true, &result);
    return result;}

DEFINE_ANE_FUNCTION(showInterstitial)
{
    [getInterstitial(freContext) showWithViewController:applicationViewController];

    FREObject result = nil;
    FRENewObjectFromBool(true, &result);
    return result;
}

TFTAppWall * getAppWall(FREContext *freContext) {
    if (appWall == nil) {
        appWall = [[TFTAppWall appWallWithDelegate:[[TFTAirAppWallDelegate alloc] initWithContext:freContext]] retain];
    }
    return appWall;
}

DEFINE_ANE_FUNCTION(prepareAppWall)
{
    [getAppWall(freContext) load];

    FREObject result = nil;
    FRENewObjectFromBool(true, &result);
    return result;
}

DEFINE_ANE_FUNCTION(showAppWall)
{
    [getAppWall(freContext) showWithViewController:applicationViewController];

    FREObject result = nil;
    FRENewObjectFromBool(true, &result);
    return result;
}

DEFINE_ANE_FUNCTION(setYearOfBirth)
{
    uint32_t ageUint32 = 0;
    FREGetObjectAsUint32(freObjects[0], &ageUint32);

    NSUInteger age = ageUint32;
    [TFTTapForTap setYearOfBirth:age];

    FREObject result = nil;
    FRENewObjectFromBool(true, &result);
    return result;
}

DEFINE_ANE_FUNCTION(setGender)
{
    uint32_t genderUint32;
    FREGetObjectAsUint32(freObjects[0], &genderUint32);
    NSUInteger gender = genderUint32;

    if (gender == 0)
    {
        [TFTTapForTap setGender:MALE];
    } else if(gender == 1)
    {
        [TFTTapForTap setGender:FEMALE];
    } else
    {
        [TFTTapForTap setGender:NONE];
    }

    FREObject result = nil;
    FRENewObjectFromBool(true, &result);
    return result;
}

DEFINE_ANE_FUNCTION(setLocation)
{
    double_t latitudeDouble;
    double_t longitudeDouble;

    FREGetObjectAsDouble(freObjects[0], &latitudeDouble);
    FREGetObjectAsDouble(freObjects[1], &longitudeDouble);

    CLLocationDegrees latitude = latitudeDouble;
    CLLocationDegrees longitude = longitudeDouble;

    CLLocation *location = [[CLLocation alloc] initWithLatitude:latitude longitude:longitude];

    [TFTTapForTap setLocation:location];

    [location release];

    FREObject result = nil;
    FRENewObjectFromBool(true, &result);
    return result;
}

DEFINE_ANE_FUNCTION(setUserAccountId)
{
    const uint8_t* userAccountIdArray = NULL;
    uint32_t length = 0;
    FREGetObjectAsUTF8(freObjects[0], &length, &userAccountIdArray);
    NSString* userAcountId = [NSString stringWithUTF8String:(const char*)userAccountIdArray];

    [TFTTapForTap setUserAccountId:userAcountId];

    FREObject result = nil;
    FRENewObjectFromBool(true, &result);
    return result;
}

DEFINE_ANE_FUNCTION(setMode)
{
    const uint8_t* modeArray = NULL;
    uint32_t length = 0;
    FREGetObjectAsUTF8(freObjects[0], &length, &modeArray);
    NSString* mode = [NSString stringWithUTF8String:(const char*)modeArray];

    if ([mode isEqualToString:@"development"])
    {
        [TFTTapForTap performSelector: @selector(setEnvironment:) withObject: @"development"];
    }

    FREObject result = nil;
    FRENewObjectFromBool(true, &result);
    return result;
}

DEFINE_ANE_FUNCTION(interstitialIsReady)
{
    BOOL isReady = false;
    if (appWall != nil) {
        isReady = appWall.readyToShow;
    }
    FREObject result = nil;
    FRENewObjectFromBool(isReady, &result);
    return result;
}

DEFINE_ANE_FUNCTION(appWallIsReady)
{
    BOOL isReady = false;
    if (interstitial != nil) {
        isReady = interstitial.readyToShow;
    }
    FREObject result = nil;
    FRENewObjectFromBool(isReady, &result);
    return result;
}

DEFINE_ANE_FUNCTION(getVersion)
{
    const char *version = [[TFTTapForTap performSelector: @selector(pluginVersion)] UTF8String];
    FREObject result = nil;
    uint32_t length = strlen(version);
    FRENewObjectFromUTF8(length, (uint8_t*) version, &result);
    return result;
}

DEFINE_ANE_FUNCTION(setAutoScale) {
    return nil;
}

void TapForTapExtensionContextInitializer(void* extData, const uint8_t* ctxType, FREContext ctx, uint32_t* numFunctionsToSet, const FRENamedFunction** functionsToSet)
{
    static FRENamedFunction functionMap[] = {
        MAP_FUNCTION(initializeWithApiKey, NULL),
        MAP_FUNCTION(setYearOfBirth, NULL),
        MAP_FUNCTION(setGender, NULL),
        MAP_FUNCTION(setLocation, NULL),
        MAP_FUNCTION(setUserAccountId, NULL),
        MAP_FUNCTION(getVersion, NULL),
        MAP_FUNCTION(createAdView, NULL),
        MAP_FUNCTION(removeAdView, NULL),
        MAP_FUNCTION(prepareInterstitial, NULL),
        MAP_FUNCTION(showInterstitial, NULL),
        MAP_FUNCTION(interstitialIsReady, NULL),
        MAP_FUNCTION(prepareAppWall, NULL),
        MAP_FUNCTION(showAppWall, NULL),
        MAP_FUNCTION(appWallIsReady, NULL),
        MAP_FUNCTION(setMode, NULL),
        MAP_FUNCTION(setAutoScale, NULL)
    };
    *numFunctionsToSet = sizeof( functionMap ) / sizeof( FRENamedFunction );
    *functionsToSet = functionMap;
}

void TapForTapExtensionContextFinalizer(FREContext ctx)
{
	return;
}

void TapForTapExtensionInitializer(void** extDataToSet, FREContextInitializer* ctxInitializerToSet, FREContextFinalizer* ctxFinalizerToSet)
{
    *extDataToSet = NULL;
    *ctxInitializerToSet = &TapForTapExtensionContextInitializer;
    *ctxFinalizerToSet = &TapForTapExtensionContextFinalizer;

    applicationView = [[[UIApplication sharedApplication] keyWindow] rootViewController].view;
    applicationViewController = [[[UIApplication sharedApplication] keyWindow] rootViewController];

    [TFTTapForTap performSelector: @selector(setPlugin:) withObject: @"air"];
    [TFTTapForTap performSelector: @selector(setPluginVersion:) withObject: @"1.2.2"];
}

void TapForTapExtensionFinalizer(void* extData)
{
    banner.delegate = nil;
    [banner release];
    banner = nil;

    [appWall release];
    appWall = nil;
    [interstitial release];
    interstitial = nil;

    [applicationView release];
    applicationView = nil;
    [applicationViewController release];
    applicationViewController = nil;
    return;
}
