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

import com.tapfortap.ane.functions.AppWallListenerImplementation;

public class ShowAppWallFunction implements FREFunction {

	@Override
	public FREObject call(FREContext freContext, FREObject[] args) {
		AppWallListenerImplementation listener = new AppWallListenerImplementation(freContext);
        AppWall.prepare(freContext.getActivity(), listener);
        AppWall.setListener(listener);
		AppWall.show(freContext.getActivity());
		try {
			return FREObject.newObject(true);
		} catch (FREWrongThreadException e) {
			return null;
		}
	}
}
