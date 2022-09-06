#!/bin/bash

# User welcome message
echo -e '\n👋 Welcome, this is the setup script for the battery CLI tool.'
echo -e "Note: this sccript will ask for your password once or multiple times. This is needed install battery to your system."
echo -e "\nPress any key to continue\n"
read

# Get smc source and build it
tempfolder=~/.battery-tmp
binfolder=/usr/local/bin
mkdir -p $tempfolder

smcfolder="$tempfolder/smc"
echo -e "\nCloning fan control version of smc"
git clone --depth 1 https://github.com/hholtmann/smcFanControl.git $smcfolder &> /dev/null
cd $smcfolder/smc-command
echo -e "\nMaking smc from source"
make &> /dev/null

# Move built file to bin folder
echo -e "\nMove smc to executable folder"
sudo mkdir -p $binfolder
sudo mv $smcfolder/smc-command/smc $binfolder
sudo chmod u+x $binfolder/smc

# Write battery function as executable
bateryfolder="$tempfolder/battery"
echo -e "\nCloning battery repository"
git clone --depth 1 https://github.com/actuallymentor/battery.git $bateryfolder &> /dev/null
echo "Writing script to $binfolder/battery"
sudo cp $bateryfolder/battery.sh $binfolder/battery
sudo chmod 755 $binfolder/battery
sudo chmod u+x $binfolder/battery

# Remove tempfiles
cd ../..
echo -e "\nRemoving temp folder $tempfolder"
rm -rf $tempfolder
echo -e "\nSmc binary built"

echo -e "\n🎉 Battery tool installed. Type \"battery\" for instructions."
