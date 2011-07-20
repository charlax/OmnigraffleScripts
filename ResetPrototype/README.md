Description
===========

You may be frequently using the Actions feature in Omnigraffle. If you happen to be using the "Shows or Hides Layers" action with the Presentation view, you may have remarked that you need to set the original view each time you want to test your prototype. For instance, if you were modifying a specific layer that you forgot to hide, it might change the way your prototype appear.

The purpose of this AppleScript is to set your Omnigraffle document to its default state. This means that **all layers will be hidden**, except:

* the printable **shared layers** (most frequently, shared layers are used to set up a general template, for instance containing the global interface layout or a browser window)
* the layers with a **name beginning with a star** “*” (you might use these layers to share some elements with all layers on a specific canvas)

To set the default state, the script will then show all all layers with a name beginning with a “1”, all layers named exactly “First Screen” (case insensitive). If there are only one layer that could be shown, it will be shown.

For more insights about how to use this script, feel free to have a look at the example file included.

Tested with OmniGraffle Professional 5.3 and Mac OS 10.6.8

Installation
============

Activate the script menu
------------------------

1. Open **Applescript Editor**
2. Choose *Applescript Editor* > *Preferences*.
3. Click on the *General* tab
4. Tick the box next to *Show script menu in menu bar*.

Install the script
------------------

1. Move the `ResetPrototype.scpt` file (not `ResetPrototype.applescript`) to `~/Library/Scripts/Applications/OmniGraffle Pro/`
2. You should not have to restart Omnigraffle. The script menu should appear in the right of your menu bar.

This page gives you more information: [http://www.petermcm.dircon.co.uk/software/og_script_install.html](http://www.petermcm.dircon.co.uk/software/og_script_install.html)

License
=======

This script is licensed under the BSD two-clause license. See `LICENSE` file for more information.