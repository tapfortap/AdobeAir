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
import com.tapfortap.ane.TapForTapExtensionContext;

public class RemoveAdViewFunction implements FREFunction {

	@Override
	public FREObject call(FREContext freContext, FREObject[] freObjects) {

		TapForTapExtensionContext extContext = (TapForTapExtensionContext)freContext;
		if(extContext.banner != null) {
			extContext.layout.removeAllViews();
			extContext.banner = null;
		}

		try {
			return FREObject.newObject(true);
		} catch (FREWrongThreadException e) {
			return null;
		}
	}
}
