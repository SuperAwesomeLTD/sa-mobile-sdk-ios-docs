Video Ads
=========

The following code block sets up a video ad and loads it:

.. code-block:: objective-c

    @implementation ViewController

    - (void)viewDidLoad {
        [super viewDidLoad];

        // to display test ads
        [SAVideo enableTestMode];

        // ask users to add two numbers when clicking on an ad
        [SAVideoAd enableParentalGate];

        // lock orientation to portrait or landscape
        [SAVideo setOrientationPortrait];

        // enable or disable a close button
        [SAVideoAd disableCloseButton];

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
            [SAVideoAd play: 30479 fromVC:self];
        }
    }
