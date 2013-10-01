package com.tapfortap.ane.functions;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
import com.adobe.fre.FREWrongThreadException;

import com.tapfortap.AppWall;

import com.tapfortap.ane.TapForTapExtensionContext;

public class AppWallIsReadyFunction implements FREFunction {
     @Override
    public FREObject call(FREContext freContext, FREObject[] freObjects) {
        try {
        	TapForTapExtensionContext extContext = (TapForTapExtensionContext)freContext;
            return FREObject.newObject(extContext.appWall.isReadyToShow());
        } catch (FREWrongThreadException e) {
            e.printStackTrace();
        }
        return null;
    }
}