/*
 * Licensed under the MIT license
 * https://tapfortap.com/LICENSE.txt
 * Copyright (c) 2013 Tap for Tap
 */

package com.tapfortap.ane;

import android.util.Log;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREExtension;
import com.tapfortap.TapForTap;

public class TapForTapExtension implements FREExtension {
    private static final String TAG = TapForTapExtension.class.getName();
    @Override
    public void initialize() {
        TapForTap.PLUGIN = "air";
        TapForTap.PLUGIN_VERSION = "1.2.2";
    }

    @Override
    public FREContext createContext(String s) {
        return new TapForTapExtensionContext();
    }

    @Override
    public void dispose() {
    }
}
