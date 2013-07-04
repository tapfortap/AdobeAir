/*
 * Licensed under the MIT license
 * http://htmlpreview.github.com/?https://github.com/tapfortap/Documentation/blob/master/License.html
 * Copyright (c) 2013 Tap for Tap
 */

#import "TapForTap.h"
#import "FlashRuntimeExtensions.h"

@interface TapForTapAirAdViewDelegate : NSObject<TapForTapAdViewDelegate> {
    FREContext* _freContext;
}
 - (id) initWithContext:(FREContext*)freContext;
@end


@interface TapForTapAirAppWallDelegate : NSObject<TapForTapAppWallDelegate> {
    FREContext* _freContext;
}
- (id) initWithContext:(FREContext*)freContext;
@end

@interface TapForTapAirInterstitialDelegate : NSObject<TapForTapInterstitialDelegate> {
    FREContext* _freContext;
}
- (id) initWithContext:(FREContext*)freContext;
@end
