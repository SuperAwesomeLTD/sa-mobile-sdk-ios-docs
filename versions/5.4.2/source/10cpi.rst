Handle CPI
==========

You can install and use the SuperAwesome SDK as an advertiser as well, if you want to measure your CPI (Cost per Install)
performance.

In order to do that you can call:

.. code-block:: objective-c

    - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

        // call the handle CPI method in your application delegate
        [[SuperAwesome getInstance] handleCPI:^(BOOL success) {
          // this callback method will indicate if the AwesomeAds server
          // considered the install event you sent a success or not
        }];

        return YES;
    }
