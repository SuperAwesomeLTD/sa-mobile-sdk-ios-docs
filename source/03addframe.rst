Add the SDK as a framework
==========================

You can also install the project as a standalone **.framework** library.

1) First you'll need to download the latest `SuperAwesomeSDK-<sdk_version_ios>.iOS.framework.zip <https://github.com/SuperAwesomeLTD/sa-sdk-build-repo/blob/master/package/SuperAwesomeSDK-<sdk_version_ios>.iOS.framework.zip?raw=true>`_.

2) You'll then need to add the .framework file in the **Embedded Binaries** section of your project's target:

.. image:: img/IMG_02_Setup_1.png

This should also add it in your project structure.

Import the SDK
^^^^^^^^^^^^^^

You can import the same SDK header file like so:

.. code-block:: c++

    #import <SuperAwesomeSDK/SuperAwesome.h>
