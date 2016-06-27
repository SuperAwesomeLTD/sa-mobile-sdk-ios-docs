Integrate the SDK
=================

**Note**: This document assumes:

* an XCode project called **iOSDemo**
* that contains a single view controller called **MyViewController**

Install the SDK through CocoaPods
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

We use `CocoaPods <http://cocoapods.org>`_ in order to make installing and updating our SDK super easy.
CocoaPods manages library dependencies for your Xcode projects.

If you don't have CocoaPods installed on your machine you can install it by issuing the following command in your terminal:

.. code-block:: shell

    sudo gem install cocoapods

After that you need to go to the project's directory and initialize CocoaPods

.. code-block:: shell

    cd /path_to/iOSDemo/
    pod init


The dependencies for your projects are specified in a single text file called a **Podfile**.
CocoaPods will resolve dependencies between libraries, fetch the resulting source code, then link it together in an Xcode workspace to build your project.
To download the latest release of the SDK add the following line to your Podfile:

.. code-block:: shell

    pod 'SuperAwesome', '<sdk_version_ios>'

so it looks something like this:

.. code-block:: shell

    # Uncomment this line to define a global platform for your project
    platform :ios, '6.0'

    target 'MyProject' do
    pod 'SuperAwesome'
    end

After the pod source has been added, update your project's dependencies by running the following command in the terminal:

.. code-block:: shell

    pod update

Don't forget to use the **.xcworkspace** file to open your project in Xcode, instead of the **.xcproj** file, from here on out.

Add the SDK as a framework
^^^^^^^^^^^^^^^^^^^^^^^^^^

If you don't want to use CocoaPods you can also install the project as a standalone **.framework** library, alongside a resource bundle.

1) First you'll need to download the latest `SuperAwesomeSDK.framework <https://github.com/SuperAwesomeLTD/sa-mobile-sdk-ios-framework/blob/master/output/SuperAwesomeSDK.framework.zip?raw=true>`_.

2) You'll then need to add the .framework file in the **Embedded Binaries** section of your project's target:

.. image:: img/IMG_02_Setup_1.png

This should also add it in your project structure.

Add the SDK as a static library
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Additionally, you can download the latest `libSuperAwesomeSDK.zip <https://github.com/SuperAwesomeLTD/sa-mobile-sdk-ios-staticlib/blob/master/output/libSuperAwesomeSDK.zip?raw=true>`_ file - which contains the **libSuperAwesomeSDK.a** and
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
