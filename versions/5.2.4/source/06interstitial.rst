Interstitial Ads
================

The following code block sets up an interstitial ad and loads it:

.. code-block:: objective-c

    @implementation ViewController

    - (void)viewDidLoad {
        [super viewDidLoad];

        // to display test ads
        [SAInterstitialAd enableTestMode];

        // lock orientation to portrait or landscape
        [SAInterstitialAd setOrientationPortrait];

        // ask users to add two numbers when clicking on an ad
        [SAInterstitialAd enableParentalGate];

        // start loading ad data for a placement
        [SAInterstitialAd load: 30473];
    }

Once you've loaded an ad, you can also display it:

.. code-block:: objective-c

    @IBAction void onClick:(id) sender {

        // check if ad is loaded
        if ([SAInterstitialAd hasAdAvailable: 30473]) {

            // display the ad
            [SAInterstitialAd play: 30473 fromVC:self];
        }
    }
