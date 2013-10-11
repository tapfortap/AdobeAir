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
import com.tapfortap.ane.functions.InterstitialListenerImplementation;

public class ShowInterstitialFunction implements FREFunction {

	@Override
	public FREObject call(FREContext freContext, FREObject[] freObjects) {
		TapForTapExtensionContext extContext = (TapForTapExtensionContext)freContext;
		if (extContext.interstitial == null) {
			extContext.interstitial = Interstitial.create(freContext.getActivity(), new InterstitialListenerImplementation(freContext));
		}
		extContext.interstitial.show();
		try {
			return FREObject.newObject(true);
		} catch (FREWrongThreadException e) {
			return null;
		}
	}
}
