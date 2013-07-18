#!/bin/bash

# Download Drush v3 from D.O and make it work on `drush` (OS X / Linux / *nix)
# Written by stemount, adapted by KarenS
# Last updated by Drupalise IT (http://drupalise.it) on 13 Sep 2010

# Update user
echo "Drush is now downloading via HTTP"

# move to home dir
cd ~
# remove current drush (if existent)
rm -rf ~/.drush/
# create drush directory (and hide it)
mkdir ~/.drush/
# move to new dir
cd ~/.drush/
# get Drush v3
curl -C - -O -s http://ftp.drupal.org/files/projects/drush-All-versions-3.0.tar.gz
# extract Drush v3
tar -xf drush*.tar.gz
# bin Drush tar
rm -f drush-All*.tar.gz

# get Pear Console Table library
# This is to be depreciated in favour of a more reliable way
# pear install console_table
cd drush/includes
curl -C - -O -s http://download.pear.php.net/package/Console_Table-1.1.3.tgz
# extract Pear
tar -xf Console_Table*.tgz
# copy the file we need
cp Console_Table-1.1.3/Table.php table.inc
# bin Console_Table tar
rm -r Console_Table-1.1.3
rm -f Console_Table*.tgz

# make drush command executable
cd ~/.drush/
chmod u+x drush/drush

# alias drush and put in bash profile
echo "alias drush='~/.drush/drush/drush'" >> ~/.bash_profile

# 'source' the .bash_profile file so updates are made
source ~/.bash_profile

# make sure that we alias drush just in case source does not work
alias drush='~/.drush/drush/drush'

# Update user on install
echo "You should see three SUCCESS(s) below if properly installed"

# Update Drush using Drush
~/.drush/drush/drush dl drush

# update drush_make and provision in drush/commands
~/.drush/drush/drush dl drush_make
~/.drush/drush/drush dl provision

# move updated additions to correct directory

mv ~/.drush/provision ~/.drush/drush/commands/
mv ~/.drush/drush_make ~/.drush/drush/commands/

# everything is installed, tell the user

echo "Drush should now be installed. type 'drush' for commands."