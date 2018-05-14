Initialise the SDK
==================

The first thing you'll need to do after adding the SDK is to initialise it in the `AppDelegate` class of your iOS app.

.. code-block:: objective-c

  #import "AwesomeAds.h"

  @interface AppDelegate ()
  @end

  @implementation AppDelegate


  - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    [AwesomeAds initSDK:false];

    return YES;
  }

Where the `initSDK` method takes a boolean parameter indicating whether logging is enabled or not.
For production environments logging should be off.
