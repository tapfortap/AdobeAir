package com.tapfortap.ane.functions;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
import com.adobe.fre.FREWrongThreadException;

import com.tapfortap.Interstitial;

public class InterstitialIsReadyFunction implements FREFunction {
     @Override
    public FREObject call(FREContext freContext, FREObject[] freObjects) {
        try {
            return FREObject.newObject(Interstitial.isPrepared());
        } catch (FREWrongThreadException e) {
            e.printStackTrace();
        }
        return null;
    }
}