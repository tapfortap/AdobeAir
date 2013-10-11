/*
 * Licensed under the MIT license
 * https://tapfortap.com/LICENSE.txt
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

import com.tapfortap.Banner;
import com.tapfortap.Banner.BannerListener;

import com.tapfortap.ane.TapForTapExtensionContext;

import android.util.Log;

public class CreateAdViewFunction implements FREFunction {

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
        int width = 320;
        int height = 50;
        if (extContext.autoScale) {
            width = (int)(320 * metrics.density);
            height = (int) (50 * metrics.density);
        }
        // Support for when a boolean determined if it was top or bottom
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
            width *= scale;
            height *= scale;
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

        Log.e("AIR TEST","Creating an ad.");
        FrameLayout.LayoutParams viewLayoutParams = new FrameLayout.LayoutParams(width, height, gravity);
        int leftMargin = extContext.autoScale ? (int)(xOffset * metrics.density) : xOffset;
        int topMargin = extContext.autoScale ? (int)(yOffset * metrics.density) : yOffset;
        viewLayoutParams.setMargins(leftMargin, topMargin, 0, 0);

        Banner banner = Banner.create(activity, new BannerListenerImplementation(freContext));
        banner.setLayoutParams(viewLayoutParams);
        extContext.layout.addView(banner);
        extContext.banner = banner;

        try {
            return FREObject.newObject(true);
        } catch (FREWrongThreadException e) {
            return null;
        }
    }

    private class BannerListenerImplementation implements com.tapfortap.Banner.BannerListener {
        private FREContext freContext;
        BannerListenerImplementation(FREContext freContext) {
            this.freContext = freContext;
        }

        @Override
        public void bannerOnReceive(Banner banner) {
            freContext.dispatchStatusEventAsync("AdViewOnReceiveAd", "");
        }

        @Override
        public void bannerOnFail(Banner banner, String reason, Throwable throwable) {
            freContext.dispatchStatusEventAsync("AdViewOnFailToReceiveAd", reason);
        }

        @Override
        public void bannerOnTap(Banner banner) {
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
