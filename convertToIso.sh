## Writen by Gabriel Kraft
## For beta versions manual changing of the file will be required because Apple likes to add " beta" at the end which causes the variables to not work.
## will need to change based on which macOS version desired
OSNAME="Monterey"
OSVERSION="12.0"
## will need to change based on .app filesize
IMAGESIZE="13500m"

#clear the screen
clear


# Create disk image
echo "##### Creating Disk Image #####"
echo "hdiutil create -o /tmp/$OSNAME -size $IMAGESIZE -volname $OSNAME -layout SPUD -fs HFS+J"
hdiutil create -o /tmp/$OSNAME -size $IMAGESIZE -volname $OSNAME -layout SPUD -fs HFS+J
echo " "

# mount disk image
echo "##### Mounting Disk Image #####"
echo "hdiutil attach /tmp/$OSNAME.dmg -noverify -mountpoint /Volumes/$OSNAME"
hdiutil attach /tmp/$OSNAME.dmg -noverify -mountpoint /Volumes/$OSNAME
echo " "

# create install media
echo "##### Creating Install Media #####"
echo "sudo /Applications/Install\ macOS\ $OSNAME.app/Contents/Resources/createinstallmedia --volume /Volumes/$OSNAME --nointeraction"
sudo /Applications/Install\ macOS\ $OSNAME.app/Contents/Resources/createinstallmedia --volume /Volumes/$OSNAME --nointeraction
echo " "

# detach mounted volume
echo "##### detaching mounted volume #####"
echo "sudo hdiutil detach /Volumes/Install\ macOS\ $OSNAME"
sudo hdiutil detach /Volumes/Install\ macOS\ $OSNAME
echo " "

#convert image to .cdr
echo "##### Convert image to .cdr #####"
echo "hdiutil convert /tmp/$OSNAME.dmg -format UDTO -o /tmp/$OSNAME.cdr"
hdiutil convert /tmp/$OSNAME.dmg -format UDTO -o /tmp/$OSNAME.cdr
echo " "

#rename to .iso
echo "##### Moving to dir Virtual Machines #####"
echo "mv /tmp/$OSNAME.cdr ~/Virtual\ Machines/ISOs/macOS-$OSVERSION-$OSNAME.iso"
mv /tmp/$OSNAME.cdr ~/Virtual\ Machines/ISOs/macOS-$OSVERSION-$OSNAME.iso
