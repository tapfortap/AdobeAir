/*
 * Licensed under the MIT license
 * http://htmlpreview.github.com/?https://github.com/tapfortap/Documentation/blob/master/License.html
 * Copyright (c) 2013 Tap for Tap
 */

package com.tapfortap.ane;

import android.util.Log;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREExtension;

public class TapForTapExtension implements FREExtension {
    private static final String TAG = TapForTapExtension.class.getName();
    @Override
    public void initialize() {
        Log.d(TAG, "TapForTapExtension initialized");
    }

    @Override
    public FREContext createContext(String s) {
        Log.d(TAG, "TapForTapExtension create context");
        return new TapForTapExtensionContext();
    }

    @Override
    public void dispose() {
    }
}
