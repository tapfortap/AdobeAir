/*
 * Licensed under the MIT license
 * http://htmlpreview.github.com/?https://github.com/tapfortap/Documentation/blob/master/License.html
 * Copyright (c) 2013 Tap for Tap
 */

package com.tapfortap.ane.functions;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
import com.adobe.fre.FREWrongThreadException;
import com.tapfortap.Interstitial;

import com.tapfortap.ane.functions.InterstitialListenerImplementation;

public class PrepareInterstitialFunction implements FREFunction {

	@Override
	public FREObject call(FREContext freContext, FREObject[] freObjects) {
		InterstitialListenerImplementation listener = new InterstitialListenerImplementation(freContext);
		Interstitial.prepare(freContext.getActivity(), listener);
		Interstitial.setListener(listener);
		try {
			return FREObject.newObject(true);
		} catch (FREWrongThreadException e) {
			e.printStackTrace();
			return null;
		}
	}

}
