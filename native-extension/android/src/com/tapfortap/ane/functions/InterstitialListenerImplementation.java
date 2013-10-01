/*
 * Licensed under the MIT license
 * http://htmlpreview.github.com/?https://github.com/tapfortap/Documentation/blob/master/License.html
 * Copyright (c) 2013 Tap for Tap
 */

package com.tapfortap.ane.functions;

import com.adobe.fre.FREContext;

import com.tapfortap.Interstitial;
import com.tapfortap.Interstitial.InterstitialListener;

import android.util.Log;

public class InterstitialListenerImplementation implements InterstitialListener {
    private FREContext freContext;

    InterstitialListenerImplementation(FREContext freContext) {
        this.freContext = freContext;
    }

    @Override
    public void interstitialOnReceive(Interstitial interstitial) {
        freContext.dispatchStatusEventAsync("InterstitialOnReceiveAd", "");
    }

    @Override
    public void interstitialOnShow(Interstitial interstitial) {
        freContext.dispatchStatusEventAsync("InterstitialOnShow", "");
    }

    @Override
    public void interstitialOnTap(Interstitial interstitial) {
        freContext.dispatchStatusEventAsync("InterstitialOnTap", "");
    }

    @Override
    public void interstitialOnDismiss(Interstitial interstitial) {
        freContext.dispatchStatusEventAsync("InterstitialOnDismiss", "");
    }

    @Override
    public void interstitialOnFail(Interstitial interstitial, String reason, Throwable throwable) {
        freContext.dispatchStatusEventAsync("InterstitialOnFailToReceiveAd", reason);
    }
}