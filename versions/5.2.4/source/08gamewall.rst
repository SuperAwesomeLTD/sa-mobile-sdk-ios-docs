Game Wall
=========

The following code block sets up an app wall ad and loads it:

.. code-block:: objective-c

    @implementation ViewController

    - (void)viewDidLoad {
        [super viewDidLoad];

        // to display test ads
        [SAGameWall enableTestMode];

        // ask users to add two numbers when clicking on an ad
        [SAGameWall enableParentalGate];

        // start loading ad data for a placement
        [SAGameWall load: 88888];
    }

Once you've loaded an ad, you can also display it:

.. code-block:: objective-c

    @IBAction void onClick:(id) sender {

        // check if ad is loaded
        if ([SAGameWall hasAdAvailable: 88888]) {

            // display the ad
            [SAGameWall play: 88888 fromVC: self];
        }
    }
