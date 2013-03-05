/*
 * Licensed under the MIT license
 * http://htmlpreview.github.com/?https://github.com/tapfortap/Documentation/blob/master/License.html
 * Copyright (c) 2013 Tap for Tap
 */

package com.tapfortap.ane.functions;

import android.location.Location;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREInvalidObjectException;
import com.adobe.fre.FREObject;
import com.adobe.fre.FRETypeMismatchException;
import com.adobe.fre.FREWrongThreadException;
import com.tapfortap.TapForTap;

public class SetLocationFunction  implements FREFunction{

	@Override
	public FREObject call(FREContext freContext, FREObject[] freObjects) {
		
		try {
			double latitude = freObjects[0].getAsDouble();
			double longitude = freObjects[1].getAsDouble();
			Location location = new Location("");
			location.setLatitude(latitude);
			location.setLongitude(longitude);
			TapForTap.setLocation(location);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (FRETypeMismatchException e) {
			e.printStackTrace();
		} catch (FREInvalidObjectException e) {
			e.printStackTrace();
		} catch (FREWrongThreadException e) {
			e.printStackTrace();
		}
		return null;
	}
	
}
