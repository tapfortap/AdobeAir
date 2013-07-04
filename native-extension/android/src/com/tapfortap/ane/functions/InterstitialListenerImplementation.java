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
        Log.e("TEST", "onReceiveAd");
        freContext.dispatchStatusEventAsync("InterstitialOnReceiveAd", "");
    }

    @Override
    public void onShow() {
        Log.e("TEST", "onShow");
        freContext.dispatchStatusEventAsync("InterstitialOnShow", "");
    }

    @Override
    public void onDismiss() {
        Log.e("TEST", "onDismiss");
        freContext.dispatchStatusEventAsync("InterstitialOnDismiss", "");
    }

    @Override
    public void onFail(String reason) {
        Log.e("TEST", "onFail");
        freContext.dispatchStatusEventAsync("InterstitialOnFailToReceiveAd", reason);
    }
}