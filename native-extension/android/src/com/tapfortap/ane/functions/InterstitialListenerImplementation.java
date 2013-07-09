/*
 * Licensed under the MIT license
 * http://htmlpreview.github.com/?https://github.com/tapfortap/Documentation/blob/master/License.html
 * Copyright (c) 2013 Tap for Tap
 */

package com.tapfortap.ane.functions;

import com.adobe.fre.FREContext;

import com.tapfortap.Interstitial.InterstitialListener;

import android.util.Log;

public class InterstitialListenerImplementation implements InterstitialListener {
    private FREContext freContext;

    InterstitialListenerImplementation(FREContext freContext) {
        this.freContext = freContext;
    }

    @Override
    public void onReceiveAd() {
        freContext.dispatchStatusEventAsync("InterstitialOnReceiveAd", "");
    }

    @Override
    public void onShow() {
        freContext.dispatchStatusEventAsync("InterstitialOnShow", "");
    }

    @Override
    public void onDismiss() {
        freContext.dispatchStatusEventAsync("InterstitialOnDismiss", "");
    }

    @Override
    public void onFail(String reason) {
        freContext.dispatchStatusEventAsync("InterstitialOnFailToReceiveAd", reason);
    }
}