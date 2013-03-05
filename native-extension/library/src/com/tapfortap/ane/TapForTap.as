/*
 * Licensed under the MIT license
 * http://htmlpreview.github.com/?https://github.com/tapfortap/Documentation/blob/master/License.html
 * Copyright (c) 2013 Tap for Tap
 */

package com.tapfortap.ane
{
	import flash.external.ExtensionContext;
	import flash.text.TextField;
	
	public class TapForTap
	{
		public static var GENDER_NONE: int = -1;
		public static var GENDER_MALE: int = 0;
		public static var GENDER_FEMALE: int = 1;
		
		private static var _instance: TapForTap;
		private var extContext: ExtensionContext;
		
		function TapForTap( enforcer: SingletonEnforcer)
		{
			extContext = ExtensionContext.createExtensionContext( "com.tapfortap.ane", "" );
	
			if ( !extContext ) {
				throw new Error( "Volume native extension is not supported on this platform." );
			} 		 
		}
		
		public static function get instance(): TapForTap {
			if ( !_instance ) {
				_instance = new TapForTap( new SingletonEnforcer() );
			}
			
			return _instance;
		}
		
		public function initializeWithApiKey( apiKey : String): void
		{
			extContext.call( "initializeWithApiKey", apiKey);
		}

		public function createAdView(displayAtTop: Boolean): void
		{
			extContext.call("createAdView", displayAtTop);	
		}
		
		public function removeAdView(): void {
			extContext.call("removeAdView");
		}
		
		public function prepareInterstitial(): void
		{
			extContext.call("prepareInterstitial");	
		}
		
		public function showInterstitial(): void
		{
			extContext.call("showInterstitial");	
		}
		
		public function prepareAppWall(): void
		{
			extContext.call("prepareAppWall");	
		}
		
		public function showAppWall(): void
		{
			extContext.call("showAppWall");
		}
		
		public function setYearOfBirth(age: int): void
		{
			extContext.call("setYearOfBirth", age);
		}
		
		public function setGender(gender: int): void
		{
			extContext.call("setGender", gender);
		}
		
		public function setLocation(latitude: Number, longitide: Number): void
		{
			extContext.call("setLocation", latitude, longitide);
		}
		
		public function setUserAccountId(userAccountId: String): void
		{
			extContext.call("setUserAccountId", userAccountId);
		}

		public function setMode(mode: String): void
		{
			extContext.call("setMode", mode);
		}
	}
}

class SingletonEnforcer 
{
}
