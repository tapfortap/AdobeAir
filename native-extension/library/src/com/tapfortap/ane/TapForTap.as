/*
 * Licensed under the MIT license
 * http://htmlpreview.github.com/?https://github.com/tapfortap/Documentation/blob/master/License.html
 * Copyright (c) 2013 Tap for Tap
 */

package com.tapfortap.ane
{
	import flash.events.EventDispatcher
	import flash.external.ExtensionContext;
	import flash.events.StatusEvent;

	public class TapForTap extends EventDispatcher
	{
		public static var GENDER_NONE: int = -1;
		public static var GENDER_MALE: int = 0;
		public static var GENDER_FEMALE: int = 1;

		public static var TOP: int = 1;
		public static var CENTER: int = 2;
		public static var BOTTOM: int = 3;
		public static var LEFT: int = 1;
		public static var RIGHT: int = 3;

		private static var _instance: TapForTap;
		private var extContext: ExtensionContext;

		function TapForTap( enforcer: SingletonEnforcer)
		{
			extContext = ExtensionContext.createExtensionContext( "com.tapfortap.ane", "" );

			if ( !extContext ) {
				throw new Error( "Tap for Tap native extension is not supported on this platform." );
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

		public function getVersion(): String
		{
			return String(extContext.call("getVersion"));
		}

		public function createAdView(... args): void
		{
			if(args.length == 1) {
				extContext.call("createAdView", args[0]);
			} else {
				extContext.call("createAdView", args[0], args[1], args[2], args[3], args[4]);
			}
		}

		public function removeAdView(): void {
			extContext.call("removeAdView");
		}

		public function prepareInterstitial(): void
		{
			extContext.call("prepareInterstitial");
		}

		public function interstitialIsReady(): Boolean
		{
			return extContext.call("interstitialIsReady");
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

		public function appWallIsReady(): Boolean
		{
			return extContext.call("appWallIsReady");
		}

		public function setMode(mode: String): void
		{
			extContext.call("setMode", mode);
		}

		public function addTapForTapEventListener(listener: Function): void {
			extContext.addEventListener(StatusEvent.STATUS, listener);
		}
	}
}

class SingletonEnforcer
{
}
