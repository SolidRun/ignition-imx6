Ignition-imx6
=============

Ignition scripts for SolidRun's i.MX6 based mini computers.

Those scripts are intended to be downloaded by Ignition as a gzipped tarball. For that Ignitio uses github API.

After being downloaded Ignition scans the directories and provides the user a list of distributions to install from.

Each directory is a distribution installation cookbook that provides name, description, icon and installation script.

Optionally it might provide a list to the user to choose from, and up to 4 custom checkboxes with different defaults that the user can choose from.

Ignition scripts directory structure
-----------------------------------------

#### <i class="icon-folder-open"></i> Directory
>#### <i class="icon-file"></i> NAME *- Name of the distribution*
>#### <i class="icon-file"></i> DESCRIPTION *- Description of the distribution*
>#### <i class="icon-file"></i> icon.png *- A 100x100 pixels icon*
>#### <i class="icon-file"></i> install.sh *- Installation script*
>#### <i class="icon-file"></i> list.sh *- Optional script to provide the GUI a list to choose from*
>#### <i class="icon-file"></i> CUSTOM0 *- Optional checkbox that the user can choose*
>#### <i class="icon-file"></i> CUSTOM1 *- Optional checkbox that the user can choose*
>#### <i class="icon-file"></i> CUSTOM2 *- Optional checkbox that the user can choose*
>#### <i class="icon-file"></i> CUSTOM3 *- Optional checkbox that the user can choose*

Development and improvement cycle
---------------------------------
Following is a recommended diagram how to improve Ignition scripts -

* Fork / clone ignition-imx project
* Modify it by creating a directory with new cookbook or fix bugs
* Create a gzipped tarball of the project
* Host the tarball into a local web server
* Boot Ignition and change the repository URL to the local web server with the file URL
* Debug
* Once ready push the changes to your fork and issue a pull request

Notes
-----
* The UI has progress indication scans the install.sh stdout/stderr and accepts a format like the following - "<any text> number%". For instance "##### 30.5%"
* Once Ignition recognizes such a pattern it updates the progress bar with the requested percentage
* When reaching 100% Ignition changes the progress bar title from "Download..." to "Installing...". It will still accept progress indication.
* Best method to provide such progress is using 'curl' with the '--progress' flag
* Bare in mind that the installation script should run on a 512MByte systems (like CuBox-i1 and HummingBoard-i1).
