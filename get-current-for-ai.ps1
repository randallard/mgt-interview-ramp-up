# PowerShell script to copy latestramp-up-journal entry, project plan, and index to ai-chat-files directory

# Create ai-chat-files directory if it doesn't exist
$aiChatFilesDir = "ai-chat-files"
if (-not (Test-Path $aiChatFilesDir)) {
    New-Item -ItemType Directory -Path $aiChatFilesDir | Out-Null
    Write-Host "Created directory: $aiChatFilesDir"
}

# Copy the project plan and status file
$projectPlanPath = "docs/project-plan-and-status.md"
if (Test-Path $projectPlanPath) {
    Copy-Item -Path $projectPlanPath -Destination $aiChatFilesDir
    Write-Host "Copied: $projectPlanPath to $aiChatFilesDir"
} else {
    Write-Host "Warning: Could not find $projectPlanPath"
}

# Copy the home index file
$indexPath = "index.md"
if (Test-Path $indexPath) {
    Copy-Item -Path $indexPath -Destination $aiChatFilesDir
    Write-Host "Copied: $indexPath to $aiChatFilesDir"
} else {
    Write-Host "Warning: Could not find $indexPath"
}

# Find and copy the latestramp-up-journal entry
$journalDir = "docs/ramp-up-journal"
if (Test-Path $journalDir) {
    # Get all entry files with pattern entry-*.md and sort them
    $entryFiles = Get-ChildItem -Path $journalDir -Filter "entry-*.md" | 
                  Where-Object { $_.Name -match "entry-\d+\.md" } |
                  Sort-Object -Property Name -Descending
    
    if ($entryFiles.Count -gt 0) {
        # Take the first (latest) entry file
        $latestEntry = $entryFiles[0]
        Copy-Item -Path $latestEntry.FullName -Destination $aiChatFilesDir
        Write-Host "Copied latest journal entry: $($latestEntry.Name) to $aiChatFilesDir"
    } else {
        Write-Host "Warning: No journal entries found in $journalDir"
    }
} else {
    Write-Host "Warning: Could not find journal directory $journalDir"
}

Write-Host "Script completed successfully!"