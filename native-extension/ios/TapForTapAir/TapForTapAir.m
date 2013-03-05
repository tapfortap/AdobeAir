/* 
 * Licensed under the MIT license
 * http://htmlpreview.github.com/?https://github.com/tapfortap/Documentation/blob/master/License.html
 * Copyright (c) 2013 Tap for Tap
 */

#import "FlashRuntimeExtensions.h"
#import "TapForTap.h"

TapForTapAdView* adView = nil;
UIView* applicationView = nil;
UIViewController* applicationViewController = nil;

FREObject initializeWithApiKey(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
{
    NSLog(@"Entering initializeWithApiKey()");
    const uint8_t* apiKeyArray = NULL;
    uint32_t length = 0;
    FREGetObjectAsUTF8(argv[0], &length, &apiKeyArray);
    NSString* apiKey = [NSString stringWithUTF8String:apiKeyArray];

    [TapForTap performSelector: @selector(_setPlugin:) withObject: @"air"];
    [TapForTap performSelector: @selector(_setPluginVersion:) withObject: @"1.0.0"];

    [TapForTap initializeWithAPIKey: apiKey];

    FREObject result = nil;
    FRENewObjectFromBool(true, &result);
    NSLog(@"Exiting initializeWithApiKey()");
    return result;
}

FREObject createAdView(FREContext context, void* funcData, uint32_t argc, FREObject argv[])
{
    NSLog(@"Entering createAddView()");

    if(adView != nil)
    {
        [adView removeFromSuperview];
        [adView release];
        adView = nil;
    }

    uint32_t displayAtTop = 0;
    FREGetObjectAsBool(argv[0], &displayAtTop);
    
    uint32_t yCoordinate = applicationView.frame.size.height - 50;
    if(displayAtTop == TRUE) {
        yCoordinate = 0;
    }
    
    uint32_t xCoordinate = (applicationView.frame.size.width - 320) / 2;
    uint32_t width = 320;
    uint32_t height = 50;
    
    if ( UIDeviceOrientationIsLandscape(applicationViewController.interfaceOrientation))
    {
        if(displayAtTop == TRUE)
        {
            yCoordinate = 0;
        } else
        {
            yCoordinate = applicationView.frame.size.width - 50;
        }

        xCoordinate = (applicationView.frame.size.height - 320) / 2;
    }
    
    adView = [[TapForTapAdView alloc] initWithFrame:CGRectMake(xCoordinate, yCoordinate, width, height)];
    
    [applicationView addSubview: adView];
    
    FREObject result = nil;
    FRENewObjectFromBool(true, &result);
    NSLog(@"Exiting createAddView()");
    return result;
}

FREObject removeAdView(FREContext context, void* funcData, uint32_t argc, FREObject argv[])
{
    NSLog(@"Entering removeAdView()");
    
    [adView removeFromSuperview];
    [adView release];
    adView = nil;
    
    FREObject result = nil;
    FRENewObjectFromBool(true, &result);
    NSLog(@"Exiting removeAdView()");
    return result;
}

FREObject prepareInterstitial(FREContext context, void* funcData, uint32_t argc, FREObject argv[])
{
    NSLog(@"Entering prepareInterstitial()");
    
    [TapForTapInterstitial prepare];
    
    FREObject result = nil;
    FRENewObjectFromBool(true, &result);
    NSLog(@"Exiting prepareInterstitial()");
    return result;}

FREObject showInterstitial(FREContext context, void* funcData, uint32_t argc, FREObject argv[])
{
    NSLog(@"Entering showInterstitial()");
    
    [TapForTapInterstitial showWithRootViewController:applicationViewController];
    
    FREObject result = nil;
    FRENewObjectFromBool(true, &result);
    NSLog(@"Exiting showInterstitial()");
    return result;
}

FREObject prepareAppWall(FREContext context, void* funcData, uint32_t argc, FREObject argv[])
{
    NSLog(@"Entering prepareAppWall()");
    
    [TapForTapAppWall prepare];
    
    FREObject result = nil;
    FRENewObjectFromBool(true, &result);
    NSLog(@"Exiting prepareAppWall()");
    return result;
}

FREObject showAppWall(FREContext context, void* funcData, uint32_t argc, FREObject argv[])
{
    NSLog(@"Entering showAppWall()");
    
    [TapForTapAppWall showWithRootViewController:applicationViewController];
    
    FREObject result = nil;
    FRENewObjectFromBool(true, &result);
    NSLog(@"Exiting showAppWall()");
    return result;
}

FREObject setYearOfBirth(FREContext context, void* funcData, uint32_t argc, FREObject argv[])
{
    NSLog(@"Entering setBirthYear()");
    
    uint32_t ageUint32 = 0;
    FREGetObjectAsUint32(argv[0], &ageUint32);
        
    NSUInteger age = ageUint32;
    [TapForTap setYearOfBirth:age];
    
    FREObject result = nil;
    FRENewObjectFromBool(true, &result);
    NSLog(@"Exiting setBirthYear()");
    return result;
}

FREObject setGender(FREContext context, void* funcData, uint32_t argc, FREObject argv[])
{
    NSLog(@"Entering setGender()");
    
    uint32_t genderUint32;
    FREGetObjectAsUint32(argv[0], &genderUint32);
    NSUInteger gender = genderUint32;
    
    
    if (gender == 0)
    {
        [TapForTap setGender:MALE];
    } else if(gender == 1)
    {
        [TapForTap setGender:FEMALE];
    } else
    {
        [TapForTap setGender:NONE];
    }
    
    FREObject result = nil;
    FRENewObjectFromBool(true, &result);
    NSLog(@"Exiting setGender()");
    return result;
}

FREObject setLocation(FREContext context, void* funcData, uint32_t argc, FREObject argv[])
{
    NSLog(@"Entering setLocation()");
    double_t latitudeDouble;
    double_t longitudeDouble;
    
    FREGetObjectAsDouble(argv[0], &latitudeDouble);
    FREGetObjectAsDouble(argv[1], &longitudeDouble);
    
    CLLocationDegrees latitude = latitudeDouble;
    CLLocationDegrees longitude = longitudeDouble;
    
    CLLocation *location = [[CLLocation alloc] initWithLatitude:latitude longitude:longitude];
    
    [TapForTap setLocation:location];
    
    [location release];
    
    FREObject result = nil;
    FRENewObjectFromBool(true, &result);
    NSLog(@"Exiting setLocation()");
    return result;
}

FREObject setUserAccountId(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
{
    NSLog(@"Entering setUserAccountId()");
    const uint8_t* userAccountIdArray = NULL;
    uint32_t length = 0;
    FREGetObjectAsUTF8(argv[0], &length, &userAccountIdArray);
    NSString* userAcountId = [NSString stringWithUTF8String:userAccountIdArray];
    
    [TapForTap setUserAccountID:userAcountId];
    
    FREObject result = nil;
    FRENewObjectFromBool(true, &result);
    NSLog(@"Exiting setUserAccountId()");
    return result;
}

FREObject setMode(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
{
    const uint8_t* modeArray = NULL;
    uint32_t length = 0;
    FREGetObjectAsUTF8(argv[0], &length, &modeArray);
    NSString* mode = [NSString stringWithUTF8String:modeArray];
    
    if ([mode isEqualToString:@"development"])
    {
        [TapForTap performSelector: @selector(_setEnvironment:) withObject: @"development"];
    }
    
    FREObject result = nil;
    FRENewObjectFromBool(true, &result);
    NSLog(@"Exiting setUserAccountId()");
    return result;
}

void TapForTapExtensionContextInitializer(void* extData, const uint8_t* ctxType, FREContext ctx, uint32_t* numFunctionsToTest, const FRENamedFunction** functionsToSet)
{
    NSLog(@"Entering TapForTapExtensionContextInitializer()");
    
    *numFunctionsToTest = 12;
    
    FRENamedFunction* func = (FRENamedFunction*) malloc(sizeof(FRENamedFunction) * *numFunctionsToTest);
    
    func[0].name = (const uint8_t*) "initializeWithApiKey";
    func[0].functionData = NULL;
    func[0].function = &initializeWithApiKey;
    
    func[1].name = (const uint8_t*) "createAdView";
    func[1].functionData = NULL;
    func[1].function = &createAdView;
    
    func[2].name = (const uint8_t*) "removeAdView";
    func[2].functionData = NULL;
    func[2].function = &removeAdView;
    
    func[3].name = (const uint8_t*) "prepareInterstitial";
    func[3].functionData = NULL;
    func[3].function = &prepareInterstitial;
    
    func[4].name = (const uint8_t*) "showInterstitial";
    func[4].functionData = NULL;
    func[4].function = &showInterstitial;
    
    func[5].name = (const uint8_t*) "prepareAppWall";
    func[5].functionData = NULL;
    func[5].function = &prepareAppWall;
    
    func[6].name = (const uint8_t*) "showAppWall";
    func[6].functionData = NULL;
    func[6].function = &showAppWall;
    
    func[7].name = (const uint8_t*) "setYearOfBirth";
    func[7].functionData = NULL;
    func[7].function = &setYearOfBirth;
    
    func[8].name = (const uint8_t*) "setGender";
    func[8].functionData = NULL;
    func[8].function = &setGender;
    
    func[9].name = (const uint8_t*) "setLocation";
    func[9].functionData = NULL;
    func[9].function = &setLocation;
    
    func[10].name = (const uint8_t*) "setUserAccountId";
    func[10].functionData = NULL;
    func[10].function = &setUserAccountId;
    
    func[11].name = (const uint8_t*) "setMode";
    func[11].functionData = NULL;
    func[11].function = &setMode;
    
    *functionsToSet = func;
    NSLog(@"Exiting TapForTapExtensionContextInitializer()");
}

void TapForTapExtensionContextFinalizer(FREContext ctx) {
    
    NSLog(@"Entering TapForTapExtensionContextFinalizer()");
    
    // Nothing to clean up
    
    NSLog(@"Exiting TapForTapExtensionContextFinalizer()");
    
	return;
}

void TapForTapExtensionInitializer(void** extDataToSet, FREContextInitializer* ctxInitializerToSet, FREContextFinalizer* ctxFinalizerToSet)
{
    
    NSLog(@"Entering TapForTapExtensionInitializer()");
    
    *extDataToSet = NULL;
    *ctxInitializerToSet = &TapForTapExtensionContextInitializer;
    *ctxFinalizerToSet = &TapForTapExtensionContextFinalizer;
    
    applicationView = [[[UIApplication sharedApplication] keyWindow] rootViewController].view;
    applicationViewController = [[[UIApplication sharedApplication] keyWindow] rootViewController];
    
    NSLog(@"Exiting TapForTapExtensionInitializer()");
}

void TapForTapExtensionFinalizer(void* extData) {
    
    NSLog(@"Entering TapForTapExtensionFinalizer()");
    
    // Nothing to clean up
    [adView release];
    adView = nil;
    [applicationView release];
    applicationView = nil;
    [applicationViewController release];
    applicationViewController = nil;
    
    NSLog(@"Exiting TapForTapExtensionFinalizer()");
    return;
}
