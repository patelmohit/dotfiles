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
# Remove original files if you don't want to go back -yolo
rm *original