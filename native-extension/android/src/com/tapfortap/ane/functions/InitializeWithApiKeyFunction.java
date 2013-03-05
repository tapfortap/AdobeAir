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

public class InitializeWithApiKeyFunction implements FREFunction {
    @Override
    public FREObject call(final FREContext freContext, final FREObject[] freObjects) {
        try {
            TapForTap.plugin = "air";
            TapForTap.pluginVersion = "1.0.0";
            TapForTap.initialize(freContext.getActivity(), freObjects[0].getAsString());
            return FREObject.newObject(true);
        } catch (FREWrongThreadException e) {
        	e.printStackTrace();
            return null;
        } catch (FREInvalidObjectException e) {
        	e.printStackTrace();
            return null;
        } catch (FRETypeMismatchException e) {
        	e.printStackTrace();
            return null;
        }
    }
}
