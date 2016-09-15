Video Ads
=========

The following code block sets up a video ad and loads it:

.. code-block:: objective-c

    @implementation ViewController

    - (void)viewDidLoad {
        [super viewDidLoad];

        // Enabling test mode will load
        // one of our test ads
        // By default it is disabled
        [SAVideo enableTestMode];

        // The parental gate requires users to
        // perform a simple math operation when
        // clicking on an ad
        [SAVideoAd enableParentalGate];

        // You can also specify a certain
        // orientation for your video ad
        [SAVideo setOrientationPortrait];

        // You can also enable or disable
        // a close button for the video
        [SAVideoAd disableCloseButton];

        // Or you can instruct it to not close
        // at the end of the video (if you
        // want to present some kind of reward,
        // for example)
        [SAVideoAd disableCloseAtEnd];

        // Finally you can start the loading
        // process by telling the SDK to load an
        // ad for a certain placement
        [SAVideo load: 30479];
    }

Once you've loaded an ad, you can also display it:

.. code-block:: objective-c

    @IBAction void onClick:(id) sender {

        // It's good practice to check first
        // if there is an ad available
        if ([SAVideoAd hasAdAvailable: 30479]) {

            // if all is OK you may play the ad
            [SAVideoAd play: 30479 fromVC:self];
        }
    }
