/*
 * Licensed under the MIT license
 * http://htmlpreview.github.com/?https://github.com/tapfortap/Documentation/blob/master/License.html
 * Copyright (c) 2013 Tap for Tap
 */

package com.tapfortap.ane.functions;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREInvalidObjectException;
import com.adobe.fre.FREObject;
import com.adobe.fre.FRETypeMismatchException;
import com.adobe.fre.FREWrongThreadException;
import com.tapfortap.TapForTap;

public class SetGenderFunction  implements FREFunction {

	@Override
	public FREObject call(FREContext freContext, FREObject[] freObjects) {
		
		try {
			int gender = freObjects[0].getAsInt();
			
			if(gender == 0) {
				TapForTap.setGender(TapForTap.Gender.MALE);
			} else if(gender == 1) {
				TapForTap.setGender(TapForTap.Gender.FEMALE);
			} else {
				TapForTap.setGender(TapForTap.Gender.NONE);
			}
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
