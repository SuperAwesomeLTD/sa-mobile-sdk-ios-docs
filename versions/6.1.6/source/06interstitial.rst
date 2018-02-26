Interstitial Ads
================

The following code block sets up an interstitial ad and loads it:

.. code-block:: objective-c

    @implementation ViewController

    - (void)viewDidLoad {
        [super viewDidLoad];

        // set config to production
        [SAInterstitialAd setConfigurationProduction];

        // to display test ads
        [SAInterstitialAd enableTestMode];

        // lock orientation to portrait or landscape
        [SAInterstitialAd setOrientationPortrait];

        // start loading ad data for a placement
        [SAInterstitialAd load: 30473];
    }

Once you've loaded an ad, you can also display it:

.. code-block:: objective-c

    @IBAction void onClick:(id) sender {

        // check if ad is loaded
        if ([SAInterstitialAd hasAdAvailable: 30473]) {

            // display the ad
            [SAInterstitialAd play: 30473 fromVC: self];
        }
    }

These are the default values:

============= =============
Parameter     Value
============= =============
Configuration Production
Test mode     Disabled
Orientation   Any
============= =============

.. note:: When locking orientation with either the **setOrientationPortrait** or **setOrientationLandscape** methods, the SDK will first look at the list of orientations
          supported by your app and conform to that.
          If, for example, you set an interstitial ad to display in landscape mode but your app only supports portrait orientations, the ad will show in portrait mode.
