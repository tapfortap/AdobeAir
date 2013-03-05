/*
 * Licensed under the MIT license
 * http://htmlpreview.github.com/?https://github.com/tapfortap/Documentation/blob/master/License.html
 * Copyright (c) 2013 Tap for Tap
 */

package com.tapfortap.ane;

import java.util.HashMap;
import java.util.Map;

import android.view.OrientationEventListener;
import android.widget.RelativeLayout;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.tapfortap.AdView;
import com.tapfortap.ane.functions.CreateAddViewFunction;
import com.tapfortap.ane.functions.InitializeWithApiKeyFunction;
import com.tapfortap.ane.functions.PrepareAppWallFunction;
import com.tapfortap.ane.functions.PrepareInterstitialFunction;
import com.tapfortap.ane.functions.RemoveAdViewFunction;
import com.tapfortap.ane.functions.SetGenderFunction;
import com.tapfortap.ane.functions.SetLocationFunction;
import com.tapfortap.ane.functions.SetModeFunction;
import com.tapfortap.ane.functions.SetUserAccountIdFunction;
import com.tapfortap.ane.functions.SetYearOfBirthFunction;
import com.tapfortap.ane.functions.ShowAppWallFunction;
import com.tapfortap.ane.functions.ShowInterstitialFunction;

public class TapForTapExtensionContext extends FREContext {
	public AdView adView;
	public RelativeLayout layout;
	
    @Override
    public Map<String, FREFunction> getFunctions() {
        Map<String, FREFunction> functions = new HashMap<String, FREFunction>();

        functions.put("initializeWithApiKey", new InitializeWithApiKeyFunction());
        functions.put("createAdView", new CreateAddViewFunction());
        functions.put("removeAdView", new RemoveAdViewFunction());
        functions.put("prepareInterstitial", new PrepareInterstitialFunction());
        functions.put("showInterstitial", new ShowInterstitialFunction());
        functions.put("prepareAppWall", new PrepareAppWallFunction());
        functions.put("showAppWall", new ShowAppWallFunction());
        functions.put("setYearOfBirth", new SetYearOfBirthFunction());
        functions.put("setGender", new SetGenderFunction());
        functions.put("setLocation", new SetLocationFunction());
        functions.put("setUserAccountId", new SetUserAccountIdFunction());
        functions.put("setMode", new SetModeFunction());

        return functions;
    }

    @Override
    public void dispose() {
    	adView = null;
    	layout = null;
    }
}
