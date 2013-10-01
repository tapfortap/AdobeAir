package com.tapfortap.ane.functions;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREInvalidObjectException;
import com.adobe.fre.FREObject;
import com.adobe.fre.FRETypeMismatchException;
import com.adobe.fre.FREWrongThreadException;

import com.tapfortap.AppWall;

import com.tapfortap.ane.TapForTapExtensionContext;

public class SetAutoScale implements FREFunction {
	@Override
	public FREObject call(FREContext freContext, FREObject[] freObjects) {
		TapForTapExtensionContext extContext = (TapForTapExtensionContext)freContext;
		try {
			extContext.autoScale = freObjects[0].getAsBool();
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
