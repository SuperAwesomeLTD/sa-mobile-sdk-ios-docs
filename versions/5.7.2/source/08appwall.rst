App Wall
========

The following code block sets up an app wall ad and loads it:

.. code-block:: objective-c

    @implementation ViewController

    - (void)viewDidLoad {
        [super viewDidLoad];

        // to display test ads
        [SAAppWall enableTestMode];

        // ask users to add two numbers when clicking on an ad
        [SAAppWall enableParentalGate];

        // start loading ad data for a placement
        [SAAppWall load: 88888];
    }

Once you've loaded an ad, you can also display it:

.. code-block:: objective-c

    @IBAction void onClick:(id) sender {

        // check if ad is loaded
        if ([SAAppWall hasAdAvailable: 88888]) {

            // display the ad
            [SAAppWall play: 88888 fromVC: self];
        }
    }

These are default values for all the parameters:

================== =============
Parameter          Value
================== =============
Configuration 	   Production
Test mode          Disabled
Parental gate      Enabled
================== =============
