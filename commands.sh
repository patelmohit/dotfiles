# Copy folder "Photos" to remote destination
scp -r Photos username@host:/path

# exiftool commands
# cheat sheet: https://thornelabs.net/posts/exiftool-commands-cheat-sheet/
# set DateTimeOriginal from FileModifyDate to file
exiftool "-DateTimeOriginal<FileModifyDate" file
# Add CreateDate Exif Property and Copy DateTimeOriginal Exif Property Value to all files in the current directory
exiftool '-createdate<datetimeoriginal' -r -if '(not $createdate and $datetimeoriginal)' .
# Then, use CreateDate to rename the current directory files according to the format of all time (same as DropBox's magical renaming)
exiftool -d '%Y-%m-%d %H.%M.%S%%-c.%%e' '-filename<CreateDate' .
# Remove original files if you don't want to go back - yolo
rm *original

# mdadm - create a RAID 1 array from /dev/sda1 and /dev/sda2 (requires partitions to be created first)
# the following guide details the steps for building the array: https://www.jeffgeerling.com/blog/2021/htgwa-create-raid-array-linux-mdadm
sudo mdadm --create --verbose /dev/md0 --level=1 --raid-devices=2 /dev/sd[a-b]1