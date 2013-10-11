/*
 * Licensed under the MIT license
 * https://tapfortap.com/LICENSE.txt
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

public class InitializeWithApiKeyFunction implements FREFunction {
    @Override
    public FREObject call(final FREContext freContext, final FREObject[] freObjects) {
        try {
            TapForTap.initialize(freContext.getActivity(), freObjects[0].getAsString());
            return FREObject.newObject(true);
        } catch (FREWrongThreadException e) {
        	e.printStackTrace();
        } catch (FREInvalidObjectException e) {
        	e.printStackTrace();
        } catch (FRETypeMismatchException e) {
        	e.printStackTrace();
        }
        return null;
    }
}
