package com.tapfortap.ane.functions;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
import com.adobe.fre.FREWrongThreadException;

import com.tapfortap.TapForTap;

public class GetVersionFunction implements FREFunction {
     @Override
    public FREObject call(FREContext freContext, FREObject[] freObjects) {
        try {
            return FREObject.newObject(TapForTap.pluginVersion);
        } catch (FREWrongThreadException e) {
            e.printStackTrace();
        }
        return null;
    }
}