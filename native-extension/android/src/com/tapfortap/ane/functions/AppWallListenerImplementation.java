/*
 * Licensed under the MIT license
 * http://htmlpreview.github.com/?https://github.com/tapfortap/Documentation/blob/master/License.html
 * Copyright (c) 2013 Tap for Tap
 */

package com.tapfortap.ane.functions;

import com.adobe.fre.FREContext;

import com.tapfortap.AppWall.AppWallListener;

import android.util.Log;

public class AppWallListenerImplementation implements AppWallListener {
    private FREContext freContext;

    AppWallListenerImplementation(FREContext freContext) {
        this.freContext = freContext;
    }

    @Override
    public void onReceiveAd() {
        freContext.dispatchStatusEventAsync("AppWallOnReceiveAd", "");
    }

    @Override
    public void onShow() {
        freContext.dispatchStatusEventAsync("AppWallOnShow", "");
    }

    @Override
    public void onDismiss() {
        freContext.dispatchStatusEventAsync("AppWallOnDismiss", "");
    }

    @Override
    public void onFail(String reason) {
        freContext.dispatchStatusEventAsync("AppWallOnFailToReceiveAd", reason);
    }
}