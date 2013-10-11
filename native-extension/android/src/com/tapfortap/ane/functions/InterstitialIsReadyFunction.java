/*
 * Licensed under the MIT license
 * https://tapfortap.com/LICENSE.txt
 * Copyright (c) 2013 Tap for Tap
 */

package com.tapfortap.ane.functions;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
import com.adobe.fre.FREWrongThreadException;

import com.tapfortap.Interstitial;

import com.tapfortap.ane.TapForTapExtensionContext;

public class InterstitialIsReadyFunction implements FREFunction {
     @Override
    public FREObject call(FREContext freContext, FREObject[] freObjects) {
        try {
        	TapForTapExtensionContext extContext = (TapForTapExtensionContext)freContext;
            return FREObject.newObject(extContext.interstitial.isReadyToShow());
        } catch (FREWrongThreadException e) {
            e.printStackTrace();
        }
        return null;
    }
}
