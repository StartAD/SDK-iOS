SDK-iOS
===========
SDK Version: 1.0<br />
Website: http://startad.mobi 

Quick Start Guide
----------------------------------

####Adding the SDK to your Project
1. Download the StartAD SDK for iOS by clicking the Download Now link, above.
2. Copy the libSADView.a to your project by performing the steps given below.
    1. Create a subdirectory named libs in the any directory of your project.
    2. Copy the libSADView.a into the libs directory.
    3. Import SADWebView.h file
    4. Link to project AdSupport.framework

####Adding a libSADView
The five lines of code it takes to add a banner:
* Import SADWebView.h file
* Declare an SADView instance
* Create it, specifying the ad application ID
* Add the view to the UI
* Load it with an ad

The easiest place to do all this is in your app's Activity.
```objc
SADWebView* webView;

if (!webView) {
	webView = [[SADWebView alloc]initWIthId:APPLICATION_ID]; // creating instance of SASWebview
	webView.sadDelegate = self; // adding the delegate
	[webView loadAd:LANGUAGE_RU andPlaceId:self.place]; // loading data with params
}

```

####Ad lifecycle events
You may optionally track ad lifecycle events like request failures or "click-through" by implementing SADWebViewDelegate.

```objc
	-(void)onReceivedAd;
	-(void)onShowedAd;
	-(void)onError:(SADVIEW_ERROR)error;
	-(void)onAdClicked;
	-(void)noAdFound;
```

Sample
```objc
	webView.sadDelegate = self; // or another ViewController

	-(void)onReceivedAd
	{
		NSLog(@"SADView  onReceivedAd");
	}

	-(void)onShowedAd
	{
		NSLog(@"SADView  onShowedAd");
	}

	-(void)onError:(SADVIEW_ERROR)error
	{
		NSLog(@"SADView error: %d", error);
	}

	-(void)onAdClicked
	{
		NSLog(@"SADView  onAdClicked");
	}

	-(void)noAdFound
	{
		NSLog(@"SADView  noAdFound");
	}
```

Legal Requirements:
----------------------------------
You must accept the [terms and conditions](http://startad.mobi/index/rules/) on the [StartAD.mobi](http://startad.mobi) website by registering in order to legally use the StartAD SDK.
