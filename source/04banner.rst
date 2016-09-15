Banner Ads
==========

The following block of code creates and loads a banner ad:

.. code-block:: objective-c

    @interface ViewController ()
    // declare a SABannerAd outlet
    @property (weak, nonatomic) IBOutlet SABannerAd *bannerAd;
    @end

    @implementation ViewController

    - (void)viewDidLoad {
        [super viewDidLoad];

        // Enabling test mode will load
        // one of our test ads
        // By default it is disabled
        [_bannerAd enableTestMode];

        // The parental gate requires users to
        // perform a simple math operation when
        // clicking on an ad
        [_bannerAd enableParentalGate];

        // Finally you can start the loading
        // process by telling the SDK to load an
        // ad for a certain placement
        [_bannerAd load:30471];

    }

Once you've loaded an ad, you can also display it:

.. code-block:: objective-c

    @IBAction void onClick:(id) sender {

        // It's good practice to check first
        // if there is an ad available
        if ([banner hasAdAvailable]) {

            // if all is OK you may play the ad
            [_bannerAd play];
        }
    }
