Integrate the SDK
=================

**Note**: This document assumes:

* an XCode project called **iOSDemo**
* that contains a single view controller called **MyViewController**

Install the SDK through CocoaPods
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Setup CocoaPods
---------------

We use `CocoaPods <http://cocoapods.org>`_ in order to make installing and updating our SDK super easy.
CocoaPods is a dependency manager for Swift and Objective-C Cocoa projects.

If you don't have CocoaPods installed on your machine you can install it by issuing the following command in your terminal:

.. code-block:: shell

    sudo gem install cocoapods

After that you need to go to the project's directory and initialize CocoaPods

.. code-block:: shell

    cd /path_to/iOSDemo/
    pod init

This will also create a special file called a **Podfile**, where you can specify what dependencies to add to your new project.
Usually it will look similar to this:

.. code-block:: shell

    target 'MyProject' do
        # add dependencies
    end

For more information on Podfile options, please check the `Podfile <https://guides.cocoapods.org/syntax/podfile.html>`_ specification.

Add the full SuperAwesome SDK
-----------------------------

You can add SuperAwesome to your project by declaring the following Pod:

.. code-block:: shell

    target 'MyProject' do
        pod 'SuperAwesome', '<sdk_version_ios>'
    end

This will tell CocoaPods to fetch the latest version of the full SuperAwesome iOS SDK. The **full** version will contain everything you
need in order to load and display banner, interstitial and video ads as well as the 3rd party `Moat Analytics <https://moat.com/analytics>`_
module.

Add the base SuperAwesome SDK
-----------------------------

Alternatively, if you want a base version of the SDK, you can declare the following Pod:

.. code-block:: shell

    target 'MyProject' do
        pod 'SuperAwesome/Base', '<sdk_version_ios>'
    end

This has the same functionality as the full version, but lacks the Moat Analytics module.

Install
-------

After the pod source has been added, update your project's dependencies by running the following command in the terminal:

.. code-block:: shell

    pod update

Don't forget to use the **.xcworkspace** file to open your project in Xcode, instead of the **.xcproj** file, from here on out.

Add the SDK as a framework
^^^^^^^^^^^^^^^^^^^^^^^^^^

If you don't want to use CocoaPods you can also install the project as a standalone **.framework** library.

1) First you'll need to download the latest `SuperAwesomeSDK-<sdk_version_ios>.iOS.framework.zip <https://github.com/SuperAwesomeLTD/sa-sdk-build-repo/blob/master/package/SuperAwesomeSDK-<sdk_version_ios>.iOS.framework.zip?raw=true>`_.

2) You'll then need to add the .framework file in the **Embedded Binaries** section of your project's target:

.. image:: img/IMG_02_Setup_1.png

This should also add it in your project structure.

Add the SDK as a static library
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Additionally, you can download the latest `SuperAwesomeSDK-<sdk_version_ios>.iOS.lib.zip <https://github.com/SuperAwesomeLTD/sa-sdk-build-repo/blob/master/package/SuperAwesomeSDK-<sdk_version_ios>.iOS.lib.zip?raw=true>`_ file - which contains the **libSuperAwesomeSDK.a** and
associated **include** folder to add to your project as a static library.

Once you've downloaded the zip archive, open it and add the library and the folder in your project.

Finish up
^^^^^^^^^

One thing to note is that sometimes, even though you're accessing SuperAwesome server data through HTTPS, the actual ad content is on HTTP, which on iOS 9+ will cause issues.

To circumvent this, add the following to your .plist file:

.. code-block:: xml

    <dict>
        <key>NSAllowsArbitraryLoads</key>
        <true/>
    </dict>
