# PowerShell script that backs up Microsoft Edge bookmarks (Favorites) by copying the relevant files from the Edge user data directory to a backup location.

#       Notes:
#	•	This script targets the Default Edge profile. If you’re using a different profile (e.g., “Profile 1”), you’ll need to change the path accordingly (User Data\Profile 1, etc.).
#	•	The backup includes:
#	•	Bookmarks: the actual bookmarks data
#	•	Favicons: icons for the bookmarks (optional but useful)
#	•	The backup file names include a timestamp to avoid overwriting previous backups.

# Set the backup destination folder
$backupFolder = "$env:USERPROFILE\Documents\EdgeBookmarksBackup"

# Get the path to the Edge user data directory
$edgeUserDataPath = "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default"

# Files to back up (Edge bookmarks are stored in 'Bookmarks' and 'Favicons')
$filesToBackup = @("Bookmarks", "Favicons")

# Create the backup folder if it doesn't exist
if (!(Test-Path -Path $backupFolder)) {
    New-Item -ItemType Directory -Path $backupFolder -Force
}

# Copy the files to the backup folder
foreach ($file in $filesToBackup) {
    $sourceFile = Join-Path -Path $edgeUserDataPath -ChildPath $file
    if (Test-Path -Path $sourceFile) {
        $destinationFile = Join-Path -Path $backupFolder -ChildPath "$file-$(Get-Date -Format yyyyMMddHHmmss)"
        Copy-Item -Path $sourceFile -Destination $destinationFile
        Write-Output "Backed up $file to $destinationFile"
    } else {
        Write-Warning "$file not found in $edgeUserDataPath"
    }
}
