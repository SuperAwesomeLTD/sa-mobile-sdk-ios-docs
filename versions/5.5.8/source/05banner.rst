Banner Ads
==========

The following block of code creates and loads a banner ad:

.. code-block:: objective-c

    @interface ViewController ()
    @property (weak, nonatomic) IBOutlet SABannerAd *bannerAd;
    @end

    @implementation ViewController

    - (void)viewDidLoad {
        [super viewDidLoad];

        // to display test ads
        [_bannerAd enableTestMode];

        // ask users to add two numbers when clicking on an ad
        [_bannerAd enableParentalGate];

        // start loading ad data for a placement
        [_bannerAd load:30471];

    }

Once you've loaded an ad, you can also display it:

.. code-block:: objective-c

    @IBAction void onClick:(id) sender {

        // check if ad is loaded
        if ([banner hasAdAvailable]) {

            // display the ad
            [_bannerAd play];
        }
    }

These are default values for all the parameters:

============= =============
Parameter     Value
============= =============
Configuration Production
Test mode     Disabled
Parental gate Enabled
Background    Gray
============= =============
