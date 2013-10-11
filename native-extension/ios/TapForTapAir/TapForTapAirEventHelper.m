/*
 * Licensed under the MIT license
 * https://tapfortap.com/LICENSE.txt
 * Copyright (c) 2013 Tap for Tap
 */

#import "FlashRuntimeExtensions.h"

#import "TFTTapForTap.h"

#import "TapForTapAirEventHelper.h"

@implementation TFTAirBannerDelegate

- (id) initWithContext:(FREContext*)freContext
{
    self = [super init];
    if (self) {
        _freContext = freContext;
    }
    return self;
}

- (void)tftBannerDidReceiveAd:(TFTBanner *)banner
{
    const uint8_t* code = (const uint8_t*) [@"AdViewOnReceiveAd" UTF8String];
    const uint8_t* level = (const uint8_t*) [@"" UTF8String];
    FREDispatchStatusEventAsync(_freContext, code, level);
}

- (void)tftBanner:(TFTBanner *)banner didFail:(NSString *)reason;
{
    const uint8_t* code = (const uint8_t*) [@"AdViewOnFailToReceiveAd" UTF8String];
    const uint8_t* level = (const uint8_t*) [reason UTF8String];
    FREDispatchStatusEventAsync(_freContext, code, level);
}

- (void)tftBannerWasTapped:(TFTBanner *)banner;
{
    const uint8_t* code = (const uint8_t*) [@"AdViewOnTapAd" UTF8String];
    const uint8_t* level = (const uint8_t*) [@"" UTF8String];
    FREDispatchStatusEventAsync(_freContext, code, level);
}
@end

@implementation TFTAirAppWallDelegate

- (id) initWithContext:(FREContext*)freContext
{
    self = [super init];
    if (self) {
        _freContext = freContext;
    }
    return self;
}

- (void)tftAppWallDidReceiveAd:(TFTAppWall *)appWall;
{
    const uint8_t* code = (const uint8_t*) [@"AppWallOnReceiveAd" UTF8String];
    const uint8_t* level = (const uint8_t*) [@"" UTF8String];
    FREDispatchStatusEventAsync(_freContext, code, level);
}

- (void)tftAppWallDidShow:(TFTAppWall *)appWall;
{
    const uint8_t* code = (const uint8_t*) [@"AppWallOnShow" UTF8String];
    const uint8_t* level = (const uint8_t*) [@"" UTF8String];
    FREDispatchStatusEventAsync(_freContext, code, level);
}

- (void)tftAppWallWasTapped:(TFTAppWall *)appWall
{
    const uint8_t* code = (const uint8_t*) [@"AppWallOnTap" UTF8String];
    const uint8_t* level = (const uint8_t*) [@"" UTF8String];
    FREDispatchStatusEventAsync(_freContext, code, level);
}

- (void)tftAppWallWasDismissed:(TFTAppWall *)appWall;
{
    const uint8_t* code = (const uint8_t*) [@"AppWallOnDismiss" UTF8String];
    const uint8_t* level = (const uint8_t*) [@"" UTF8String];
    FREDispatchStatusEventAsync(_freContext, code, level);
}

- (void)tftAppWall:(TFTAppWall *)appWall didFail:(NSString *)reason;
{
    const uint8_t* code = (const uint8_t*) [@"AppWallOnFailToReceiveAd" UTF8String];
    const uint8_t* level = (const uint8_t*) [reason UTF8String];
    FREDispatchStatusEventAsync(_freContext, code, level);
}
@end

@implementation TFTAirInterstitialDelegate

- (id) initWithContext:(FREContext*)freContext
{
    self = [super init];
    if (self) {
        _freContext = freContext;
    }
    return self;
}

- (void)tftInterstitialDidReceiveAd:(TFTInterstitial *)interstitial;
{
    const uint8_t* code = (const uint8_t*) [@"InterstitialOnReceiveAd" UTF8String];
    const uint8_t* level = (const uint8_t*) [@"" UTF8String];
    FREDispatchStatusEventAsync(_freContext, code, level);
}

- (void)tftInterstitialDidShow:(TFTInterstitial *)interstitial;
{
    const uint8_t* code = (const uint8_t*) [@"InterstitialOnShow" UTF8String];
    const uint8_t* level = (const uint8_t*) [@"" UTF8String];
    FREDispatchStatusEventAsync(_freContext, code, level);
}

- (void)tftInterstitialWasTapped:(TFTInterstitial *)interstitial
{
    const uint8_t* code = (const uint8_t*) [@"InterstitialOnTap" UTF8String];
    const uint8_t* level = (const uint8_t*) [@"" UTF8String];
    FREDispatchStatusEventAsync(_freContext, code, level);
}

- (void)tftInterstitialWasDismissed:(TFTInterstitial *)interstitial;
{
    const uint8_t* code = (const uint8_t*) [@"InterstitialOnDismiss" UTF8String];
    const uint8_t* level = (const uint8_t*) [@"" UTF8String];
    FREDispatchStatusEventAsync(_freContext, code, level);
}

- (void)tftInterstitial:(TFTInterstitial *)interstitial didFail:(NSString *)reason;
{
    const uint8_t* code = (const uint8_t*) [@"InterstitialOnFailToReceiveAd" UTF8String];
    const uint8_t* level = (const uint8_t*) [reason UTF8String];
    FREDispatchStatusEventAsync(_freContext, code, level);
}
@end
