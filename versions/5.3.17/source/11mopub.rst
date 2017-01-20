Integrate with MoPub
====================

If you already have MoPub ads serving in your app, but want to integrate SuperAwesome as well,
without having to directly use the AwesomeAds SDK, you can follow the steps below:

1) Add the SuperAwesome MoPub adapters to your app:

To do this, you must change your **Podfile** to contain the following:

.. code-block:: shell

    target 'MyProject' do
        # add the SuperAwesome SDK
        pod 'SuperAwesome', '<sdk_version>'
        # or add just the base SDK
        # pod 'SuperAwesome/Base', '<sdk_version>'

        # add the MoPub plugin
        pod 'SuperAwesome/MoPub', '<sdk_version>'
    end

and execute

.. code-block:: shell

    pod update

The MoPub plugin will contain three main classes that conform to MoPub's guidelines regarding 3rd party ad network adapters:

* `SuperAwesomeBannerCustomEvent <https://github.com/SuperAwesomeLTD/sa-mobile-sdk-ios/blob/master/Pod/Plugin/MoPub/SuperAwesomeBannerCustomEvent.h>`_
* `SuperAwesomeInterstitialCustomEvent <https://github.com/SuperAwesomeLTD/sa-mobile-sdk-ios/blob/master/Pod/Plugin/MoPub/SuperAwesomeInterstitialCustomEvent.h>`_
* `SuperAwesomeRewardedVideoCustomEvent <https://github.com/SuperAwesomeLTD/sa-mobile-sdk-ios/blob/master/Pod/Plugin/MoPub/SuperAwesomeRewardedVideoCustomEvent.h>`_

Alternatively you can download a .zip file of the MoPub plugin, if you don't want to use CocoaPods: `SuperAwesomeSDK-<sdk_version>.iOS.MoPubPlugin.zip <https://github.com/SuperAwesomeLTD/sa-sdk-build-repo/blob/master/package/aa_ios/<sdk_version>/SuperAwesomeSDK-<sdk_version>.iOS.MoPubPlugin.zip?raw=true>`_.

2) Setup a MoPub custom network

From your MoPub admin interface you should create a `New Network`

.. image:: img/IMG_07_MoPub_1.png

From the next menu, select `Custom Native Network`

.. image:: img/IMG_07_MoPub_2.png

You'll be taken to a new page. Here select the title of the new network

.. image:: img/IMG_07_MoPub_3.png

And assign custom inventory details for Banner, Interstitial and Video ads:

.. image:: img/IMG_07_MoPub_4.png

3) Assign custom event classes for your MoPub ads:

There are

* for Banner Ads: **SuperAwesomeBannerCustomEvent**
* for Interstitial Ads: **SuperAwesomeInterstitialCustomEvent**
* for Rewarded Video Ads: **SuperAwesomeRewardedVideoCustomEvent**

Notice these are identical to the names of the files you downloaded in step one.

4) Assign custom event data as JSON:

.. code-block:: shell

    {
        "placementId": 30473,
        "isTestEnabled": true,
        "isParentalGateEnabled": true,
        "orientation": "ANY" or "PORTRAIT" or "LANDSCAPE",
        "shouldShowCloseButton": false,
        "shouldAutomaticallyCloseAtEnd": true,
        "shouldShowSmallClickButton": true or false
    }
