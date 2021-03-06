Video Ads
=========

The following code block sets up a video ad and loads it:

.. code-block:: objective-c

    @implementation ViewController

    - (void)viewDidLoad {
        [super viewDidLoad];

        // set whole video surface clickable
        [SAVideoAd disableSmallClick];

        // set config to production
        [SAVideoAd setConfigurationProduction];

        // to display test ads
        [SAVideo enableTestMode];

        // lock orientation to portrait or landscape
        [SAVideo setOrientationPortrait];

        // enable or disable a close button
        [SAVideoAd enableCloseButton];

        // enable or disable auto-closing at the end
        [SAVideoAd disableCloseAtEnd];

        // start loading ad data for a placement
        [SAVideo load: 30479];
    }

Once you've loaded an ad, you can also display it:

.. code-block:: objective-c

    @IBAction void onClick:(id) sender {

        // check if ad is loaded
        if ([SAVideoAd hasAdAvailable: 30479]) {

            // display the ad
            [SAVideoAd play: 30479 fromVC: self];
        }
    }

These are the default values:

================== =============
Parameter          Value
================== =============
Configuration 	   Production
Test mode          Disabled
Orientation        Any
Closes at end      True
Close button       Disabled
Small click button Disabled
================== =============

.. note:: When locking orientation with either the **setOrientationPortrait** or **setOrientationLandscape** methods, the SDK will first look at the list of orientations
          supported by your app and conform to that.
          If, for example, you set a video ad to display in landscape mode but your app only supports portrait orientations, the ad will show in portrait mode.
