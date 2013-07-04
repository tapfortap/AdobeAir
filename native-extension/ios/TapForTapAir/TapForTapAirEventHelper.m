/*
 * Licensed under the MIT license
 * http://htmlpreview.github.com/?https://github.com/tapfortap/Documentation/blob/master/License.html
 * Copyright (c) 2013 Tap for Tap
 */

#import "FlashRuntimeExtensions.h"

#import "TapForTap.h"

#import "TapForTapAirEventHelper.h"

@implementation TapForTapAirAdViewDelegate

- (id) initWithContext:(FREContext*)freContext
{
    self = [super init];
    if (self) {
        _freContext = freContext;
    }
    return self;
}

- (void) tapForTapAdViewDidReceiveAd: (TapForTapAdView *)adView
{
    const uint8_t* code = (const uint8_t*) [@"AdViewOnReceiveAd" UTF8String];
    const uint8_t* level = (const uint8_t*) [@"" UTF8String];
    FREDispatchStatusEventAsync(_freContext, code, level);
}

- (void) tapForTapAdView: (TapForTapAdView *)adView didFailToReceiveAd: (NSString *)reason
{
    const uint8_t* code = (const uint8_t*) [@"AdViewOnFailToReceiveAd" UTF8String];
    const uint8_t* level = (const uint8_t*) [reason UTF8String];
    FREDispatchStatusEventAsync(_freContext, code, level);
}

- (void) tapForTapAdViewWasTapped: (TapForTapAdView *)adView
{
    const uint8_t* code = (const uint8_t*) [@"AdViewOnTapAd" UTF8String];
    const uint8_t* level = (const uint8_t*) [@"" UTF8String];
    FREDispatchStatusEventAsync(_freContext, code, level);
}
@end

@implementation TapForTapAirAppWallDelegate

- (id) initWithContext:(FREContext*)freContext
{
    self = [super init];
    if (self) {
        _freContext = freContext;
    }
    return self;
}

- (void) tapForTapAppWallDidReceiveAd
{
    const uint8_t* code = (const uint8_t*) [@"AppWallOnReceiveAd" UTF8String];
    const uint8_t* level = (const uint8_t*) [@"" UTF8String];
    FREDispatchStatusEventAsync(_freContext, code, level);
}

- (void) tapForTapAppWallDidShow
{
    const uint8_t* code = (const uint8_t*) [@"AppWallOnShow" UTF8String];
    const uint8_t* level = (const uint8_t*) [@"" UTF8String];
    FREDispatchStatusEventAsync(_freContext, code, level);
}

- (void) tapForTapAppWallWasDismissed
{
    const uint8_t* code = (const uint8_t*) [@"AppWallOnDismiss" UTF8String];
    const uint8_t* level = (const uint8_t*) [@"" UTF8String];
    FREDispatchStatusEventAsync(_freContext, code, level);
}

- (void) tapForTapAppWallFailedToDownload: (NSString *) reason
{
    const uint8_t* code = (const uint8_t*) [@"AppWallOnFailToReceiveAd" UTF8String];
    const uint8_t* level = (const uint8_t*) [reason UTF8String];
    FREDispatchStatusEventAsync(_freContext, code, level);
}
@end

@implementation TapForTapAirInterstitialDelegate

- (id) initWithContext:(FREContext*)freContext
{
    self = [super init];
    if (self) {
        _freContext = freContext;
    }
    return self;
}

- (void) tapForTapInterstitialDidReceiveAd
{
    const uint8_t* code = (const uint8_t*) [@"InterstitialOnReceiveAd" UTF8String];
    const uint8_t* level = (const uint8_t*) [@"" UTF8String];
    FREDispatchStatusEventAsync(_freContext, code, level);
}

- (void) tapForTapInterstitialDidShow
{
    const uint8_t* code = (const uint8_t*) [@"InterstitialOnShow" UTF8String];
    const uint8_t* level = (const uint8_t*) [@"" UTF8String];
    FREDispatchStatusEventAsync(_freContext, code, level);
}

- (void) tapForTapInterstitialWasDismissed
{
    const uint8_t* code = (const uint8_t*) [@"InterstitialOnDismiss" UTF8String];
    const uint8_t* level = (const uint8_t*) [@"" UTF8String];
    FREDispatchStatusEventAsync(_freContext, code, level);
}

- (void) tapForTapInterstitialFailedToDownload: (NSString *) reason
{
    const uint8_t* code = (const uint8_t*) [@"InterstitialOnFailToReceiveAd" UTF8String];
    const uint8_t* level = (const uint8_t*) [reason UTF8String];
    FREDispatchStatusEventAsync(_freContext, code, level);
}
@end