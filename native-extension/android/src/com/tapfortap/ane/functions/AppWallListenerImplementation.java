/*
 * Licensed under the MIT license
 * http://htmlpreview.github.com/?https://github.com/tapfortap/Documentation/blob/master/License.html
 * Copyright (c) 2013 Tap for Tap
 */

package com.tapfortap.ane.functions;

import com.adobe.fre.FREContext;

import com.tapfortap.AppWall;
import com.tapfortap.AppWall.AppWallListener;

import android.util.Log;

public class AppWallListenerImplementation implements AppWallListener {
    private FREContext freContext;

    AppWallListenerImplementation(FREContext freContext) {
        this.freContext = freContext;
    }

    @Override
    public void appWallOnReceive(AppWall appWall) {
        freContext.dispatchStatusEventAsync("AppWallOnReceiveAd", "");
    }

    @Override
    public void appWallOnShow(AppWall appWall) {
        freContext.dispatchStatusEventAsync("AppWallOnShow", "");
    }

    @Override
    public void appWallOnTap(AppWall appWall) {
        freContext.dispatchStatusEventAsync("AppWallOnTap", "");
    }

    @Override
    public void appWallOnDismiss(AppWall appWall) {
        freContext.dispatchStatusEventAsync("AppWallOnDismiss", "");
    }

    @Override
    public void appWallOnFail(AppWall appWall, String reason, Throwable throwable) {
        freContext.dispatchStatusEventAsync("AppWallOnFailToReceiveAd", reason);
    }
}