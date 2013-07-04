/*
 * Licensed under the MIT license
 * http://htmlpreview.github.com/?https://github.com/tapfortap/Documentation/blob/master/License.html
 * Copyright (c) 2013 Tap for Tap
 */

package com.tapfortap.ane.functions;

import android.app.Activity;
import android.util.DisplayMetrics;
import android.view.Gravity;
import android.widget.FrameLayout;
import android.widget.FrameLayout.LayoutParams;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREInvalidObjectException;
import com.adobe.fre.FREObject;
import com.adobe.fre.FRETypeMismatchException;
import com.adobe.fre.FREWrongThreadException;

import com.tapfortap.AdView;
import com.tapfortap.AdView.AdViewListener;

import com.tapfortap.ane.TapForTapExtensionContext;

import android.util.Log;

public class CreateAddViewFunction implements FREFunction{

    @Override
    public FREObject call(FREContext freContext, FREObject[] freObjects) {
    	Activity activity = freContext.getActivity();
    	TapForTapExtensionContext extContext = (TapForTapExtensionContext)freContext;

    	if(extContext.layout != null) {
    		extContext.layout.removeAllViews();
    	} else {
            extContext.layout = new FrameLayout(activity);
            FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(LayoutParams.MATCH_PARENT, LayoutParams.MATCH_PARENT);
            activity.addContentView(extContext.layout, layoutParams);
        }


        int horizontalAlignemnt = 0;
        int verticalAlignment = 0;
        int xOffset = 0;
        int yOffset = 0;
        double scale = 1;
        int gravity = 0;

    	// Setup the adView
        DisplayMetrics metrics = activity.getResources().getDisplayMetrics();
        int width = (int)(320 * metrics.density * scale);
        int height = (int) (50 * metrics.density * scale);

        // Support for when a boolean determined if it was yop or bottom
        Boolean atTop = displayAtTop(freObjects);
        if(atTop != null) {
            if(atTop) {
            	gravity |= Gravity.TOP;
            } else {
            	gravity |= Gravity.BOTTOM;
            }
            gravity |= Gravity.CENTER_HORIZONTAL;
        } else {
            // New API with position, offset and scale
            horizontalAlignemnt = getHorizontalAlignment(freObjects);
            verticalAlignment = getVerticalAlignment(freObjects);
            xOffset = getXOffset(freObjects);
            yOffset = getYOffset(freObjects);
            scale = getScale(freObjects);
            switch(horizontalAlignemnt) {
                case 1:
                    gravity |= Gravity.LEFT;
                    break;
                case 2:
                    gravity |= Gravity.CENTER_HORIZONTAL;
                    break;
                case 3:
                    gravity |= Gravity.RIGHT;
                    break;
                default:
                    gravity |= Gravity.CENTER_HORIZONTAL;
                    break;
            }

            switch(verticalAlignment) {
                case 1:
                    gravity |= Gravity.TOP;
                    break;
                case 2:
                    gravity |= Gravity.CENTER_VERTICAL;
                    break;
                case 3:
                    gravity |= Gravity.BOTTOM;
                    break;
                default:
                    gravity |= Gravity.BOTTOM;
                    break;
            }
        }

        Log.e("TEST", "" + horizontalAlignemnt);
        Log.e("TEST", "" + verticalAlignment);
        Log.e("TEST", "" + xOffset);
        Log.e("TEST", "" + yOffset);
        Log.e("TEST", "" + scale);

        FrameLayout.LayoutParams viewLayoutParams = new FrameLayout.LayoutParams(width, height, gravity);
        int leftMargin = (int)(xOffset * metrics.density);
        int topMargin = (int)(yOffset * metrics.density);
        viewLayoutParams.setMargins(leftMargin, topMargin, 0, 0);

        AdView adView = new AdView(activity);
        Log.e("TEST", "creating an adView");
        adView.setListener(new AdViewListenerImplementation(freContext));
        adView.setLayoutParams(viewLayoutParams);
        extContext.layout.addView(adView);
        extContext.adView = adView;

        try {
            return FREObject.newObject(true);
        } catch (FREWrongThreadException e) {
            return null;
        }
    }

    private class AdViewListenerImplementation implements com.tapfortap.AdView.AdViewListener {
        private FREContext freContext;
        AdViewListenerImplementation(FREContext freContext) {
            Log.e("TEST", "creating an AdViewListenerImplementation");
            this.freContext = freContext;
        }

        @Override
        public void onReceiveAd() {
            Log.e("TEST", "onReceiveAd");
            freContext.dispatchStatusEventAsync("AdViewOnReceiveAd", "");
        }

        @Override
        public void onFailToReceiveAd(String reason) {
            Log.e("TEST", "onFailToReceiveAd");
            freContext.dispatchStatusEventAsync("AdViewOnFailToReceiveAd", reason);
        }

        @Override
        public void onTapAd() {
            Log.e("TEST", "onTapAd");
            freContext.dispatchStatusEventAsync("AdViewOnTapAd", "");
        }
    }

	private Boolean displayAtTop(FREObject[] freObjects) {
		try {
			return freObjects[0].getAsBool();
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (FRETypeMismatchException e) {
			return null;
		} catch (FREInvalidObjectException e) {
			e.printStackTrace();
		} catch (FREWrongThreadException e) {
			e.printStackTrace();
		}
		return null;
	}

    private int getVerticalAlignment(FREObject[] freObjects) {
        try {
            return freObjects[0].getAsInt();
        } catch (IllegalStateException e) {
            e.printStackTrace();
        } catch (FRETypeMismatchException e) {
            e.printStackTrace();
        } catch (FREInvalidObjectException e) {
            e.printStackTrace();
        } catch (FREWrongThreadException e) {
            e.printStackTrace();
        }
        return 0;
    }

    private int getHorizontalAlignment(FREObject[] freObjects) {
        try {
            return freObjects[1].getAsInt();
        } catch (IllegalStateException e) {
            e.printStackTrace();
        } catch (FRETypeMismatchException e) {
            e.printStackTrace();
        } catch (FREInvalidObjectException e) {
            e.printStackTrace();
        } catch (FREWrongThreadException e) {
            e.printStackTrace();
        }
        return 0;
    }

    private int getXOffset(FREObject[] freObjects) {
        try {
            return freObjects[2].getAsInt();
        } catch (IllegalStateException e) {
            e.printStackTrace();
        } catch (FRETypeMismatchException e) {
            e.printStackTrace();
        } catch (FREInvalidObjectException e) {
            e.printStackTrace();
        } catch (FREWrongThreadException e) {
            e.printStackTrace();
        }
        return 0;
    }

    private int getYOffset(FREObject[] freObjects) {
        try {
            return freObjects[3].getAsInt();
        } catch (IllegalStateException e) {
            e.printStackTrace();
        } catch (FRETypeMismatchException e) {
            e.printStackTrace();
        } catch (FREInvalidObjectException e) {
            e.printStackTrace();
        } catch (FREWrongThreadException e) {
            e.printStackTrace();
        }
        return 0;
    }

    private double getScale(FREObject[] freObjects) {
        try {
            return freObjects[4].getAsDouble();
        } catch (IllegalStateException e) {
            e.printStackTrace();
        } catch (FRETypeMismatchException e) {
            e.printStackTrace();
        } catch (FREInvalidObjectException e) {
            e.printStackTrace();
        } catch (FREWrongThreadException e) {
            e.printStackTrace();
        }
        return 1;
    }

}
