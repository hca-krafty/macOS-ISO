
OSNAME="Mojave"
OSVERSION="10.14"
IMAGESIZE="6000m"
VOLNAME="Mojave"



# Create disk image
hdiutil create -o /tmp/$OSNAME -size $IMAGESIZE -volname $VOLNAME -layout SPUD -fs HFS+J

# mount disk image
hdiutil attach /tmp/$OSNAME.dmg -noverify -mountpoint /Volumes/$OSNAME

# create install media
sudo /Applications/Install\ macOS\ $OSNAME.app/Contents/Resources/createinstallmedia --volume /Volumes/$OSNAME

# detach mounted volume
#sudo hdiutil detach /Volumes/Install macOS\ $OSNAME

#convert image to .cdr
hdiutil convert /tmp/$OSNAME.dmg -format UDTO -o /tmp/$OSNAME.cdr

#rename to .iso
mv /tmp/macOS-$OSVERSION-$OSNAME.cdr ~/Virtual\ Machines/ISOs/macOS-$OSVERSION-$OSNAME.iso
