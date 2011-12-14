#!/usr/bin/env python
# encoding: utf-8
"""
install.py

Created by Charles-Axel Dein on 2011-10-03.
Copyright (c) 2011 Charles-Axel Dein. All rights reserved.
"""

import shutil
import os
import logging

INSTALL_DIRECTORY = "~/Library/Scripts/Applications/Omnigraffle Pro/"
SCRIPTS = ("ExportAllFiles", "ExportAllLayers", "ResetPrototype", "ExportForiPad")

def main():
    install_directory = os.path.expanduser(INSTALL_DIRECTORY)
    
    # creates INSTALL_DIRECTORY if necessary
    if not os.path.exists(install_directory):
        os.makedirs(install_directory)
    
    for s in SCRIPTS:
        applescript_filename = os.path.join(s, s + ".applescript")
        scpt_filename = os.path.join(s, s + ".scpt")
        
        print "Compiling %s" % (scpt_filename)
        os.system('osacompile -o "%s" "%s"' % 
            (scpt_filename, applescript_filename))
        
        print "Installing %s" % scpt_filename
        shutil.copy(scpt_filename, install_directory)
        logging.debug("Copied %s to %s" % (scpt_filename, install_directory))

    print "Cleaning up..."
    for s in SCRIPTS:
        scpt_filename = os.path.join(s, s + ".scpt")
        logging.debug("Deleting %s" % applescript_filename)
        os.remove(scpt_filename)
    
    print "\nInstallation finished."

if __name__ == '__main__':
    main()

