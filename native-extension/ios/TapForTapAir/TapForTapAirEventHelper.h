/*
 * Licensed under the MIT license
 * http://htmlpreview.github.com/?https://github.com/tapfortap/Documentation/blob/master/License.html
 * Copyright (c) 2013 Tap for Tap
 */

#import "TFTTapForTap.h"
#import "FlashRuntimeExtensions.h"

@interface TFTAirBannerDelegate : NSObject<TFTBannerDelegate> {
    FREContext* _freContext;
}
 - (id) initWithContext:(FREContext*)freContext;
@end


@interface TFTAirAppWallDelegate : NSObject<TFTAppWallDelegate> {
    FREContext* _freContext;
}
- (id) initWithContext:(FREContext*)freContext;
@end

@interface TFTAirInterstitialDelegate : NSObject<TFTInterstitialDelegate> {
    FREContext* _freContext;
}
- (id) initWithContext:(FREContext*)freContext;
@end
