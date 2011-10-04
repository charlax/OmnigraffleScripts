Description
===========

Scripts to increase your productivity with Omnigraffle.

* ExportAllLayers: exports all layers in all canvases to an image file
* ExportAllFiles: exports all the opened files as a PDF
* ResetPrototype: shows some layers, hides others to set the prototype to its blank state

Tested with OmniGraffle Professional 5.3.4 and Mac OS 10.6.8

License
=======

These scripts are licensed under the **BSD two-clause license**. See `LICENSE.txt` file for more information.

Installation
============

Activate the script menu
------------------------

1. Open **Applescript Editor**
2. Choose *Applescript Editor* > *Preferences*.
3. Click on the *General* tab
4. Tick the box next to *Show script menu in menu bar*.

Install the scripts
-------------------

Just run this script:

	$ python install.py

It will compile the scripts and copy everything into the relevant folder.

This page gives you more information about Omnigraffle's script installation:  [http://www.petermcm.dircon.co.uk/software/og_script_install.html](http://www.petermcm.dircon.co.uk/software/og_script_install.html). Read it if you use Leopard or Tiger.

License
=======

This script is licensed under the BSD two-clause license. See `LICENSE` file for more information.

ExportAllFiles
==============

**This script exports all your opened files as PDF.**

ExportAllLayers
===============

**This script exports all the layers in all the canvases as an image.**

1. Preparation: shows all shared layers (to share elements among canvases) and all layers beginning with a start “*” (to share elements among layers on the same canvas), hides all other layers.
2. Show layers one by one and export as an image file (PNG by default)

You can try with ResetPrototype's example file (they follow the same principles).

ResetPrototype
==============

**This script resets your file to its blank state.**

You may be frequently using the Actions feature in Omnigraffle. If you happen to be using the "Shows or Hides Layers" action with the Presentation view, you may have remarked that you need to set the original view each time you want to test your prototype. For instance, if you were modifying a specific layer that you forgot to hide, it might change the way your prototype appear.

The purpose of this AppleScript is to set your Omnigraffle document to its default state. This means that **all layers will be hidden**, except:

* the printable **shared layers** (most frequently, shared layers are used to set up a general template, for instance containing the global interface layout or a browser window)
* the layers with a **name beginning with a star** “*” (you might use these layers to share some elements with all layers on a specific canvas)

To set the default state, the script will then show all all layers with a name beginning with a “1”, all layers named exactly “First Screen” (case insensitive). If there are only one layer that could be shown, it will be shown.

For more insights about how to use this script, feel free to have a look at the example file included.