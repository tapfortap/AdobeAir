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

import com.tapfortap.AppWall;

import com.tapfortap.ane.TapForTapExtensionContext;
import com.tapfortap.ane.functions.AppWallListenerImplementation;

public class PrepareAppWallFunction implements FREFunction {

	@Override
	public FREObject call(FREContext freContext, FREObject[] args) {
		TapForTapExtensionContext extContext = (TapForTapExtensionContext)freContext;

		if (extContext.appWall == null) {
			extContext.appWall = AppWall.create(freContext.getActivity(), new AppWallListenerImplementation(freContext));
		} else {
			extContext.appWall.load();
		}

		try {
			return FREObject.newObject(true);
		} catch (FREWrongThreadException e) {
			e.printStackTrace();
			return null;
		}
	}
}
