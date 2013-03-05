/*
 * Licensed under the MIT license
 * http://htmlpreview.github.com/?https://github.com/tapfortap/Documentation/blob/master/License.html
 * Copyright (c) 2013 Tap for Tap
 */

package com.tapfortap.ane.functions;

import android.app.Activity;
import android.util.DisplayMetrics;
import android.widget.RelativeLayout;
import android.widget.RelativeLayout.LayoutParams;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREInvalidObjectException;
import com.adobe.fre.FREObject;
import com.adobe.fre.FRETypeMismatchException;
import com.adobe.fre.FREWrongThreadException;
import com.tapfortap.AdView;
import com.tapfortap.ane.TapForTapExtensionContext;

public class CreateAddViewFunction implements FREFunction{
	
    @Override
    public FREObject call(FREContext freContext, FREObject[] freObjects) {
    	Activity activity = freContext.getActivity();
        
    	// Load in the extenstion context
    	TapForTapExtensionContext extContext = (TapForTapExtensionContext)freContext;
    	
    	if(extContext.layout != null) {
    		extContext.layout.removeAllViews();
    	}
    	
		extContext.layout = new RelativeLayout(activity);
		RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(LayoutParams.MATCH_PARENT, LayoutParams.MATCH_PARENT);
		activity.addContentView(extContext.layout, layoutParams);
    	
    	// Setup the adView
        DisplayMetrics metrics = activity.getResources().getDisplayMetrics();
        int width = (int)(320 * metrics.density);
        int height = (int) (50 * metrics.density);

        RelativeLayout.LayoutParams viewLayoutParams = new LayoutParams(width, height);
        if(displayAtTop(freObjects) ) {
        	viewLayoutParams.addRule(RelativeLayout.ALIGN_PARENT_TOP);
        } else {
        	viewLayoutParams.addRule(RelativeLayout.ALIGN_PARENT_BOTTOM);        	
        }
        viewLayoutParams.addRule(RelativeLayout.CENTER_HORIZONTAL);
        AdView adView = new AdView(activity);
        adView.setLayoutParams(viewLayoutParams);
        
        extContext.layout.addView(adView);
        extContext.adView = adView;
        
        try {
            return FREObject.newObject(true);
        } catch (FREWrongThreadException e) {
            return null;
        }
    }

	private boolean displayAtTop(FREObject[] freObjects) {
		try {
			return freObjects[0].getAsBool();
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (FRETypeMismatchException e) {
			e.printStackTrace();
		} catch (FREInvalidObjectException e) {
			e.printStackTrace();
		} catch (FREWrongThreadException e) {
			e.printStackTrace();
		}
		return false;
	}
}
