#Requires -Version 5.1
param([switch]$DryRun)
$ErrorActionPreference = "Stop"

$REPO_URL         = "https://github.com/antonkoetzler/dotfiles"
$SSH_PUSH         = "git@github.com:antonkoetzler/dotfiles.git"
$NVIM_SSH         = "git@github.com:antonkoetzler/nvim-config"
$NVIM_HTTPS       = "https://github.com/antonkoetzler/nvim-config"
$ALACRITTY_THEMES = "https://github.com/alacritty/alacritty-theme"
$DOTDIR           = "$HOME\.dotfiles"

function Write-Step { param($msg) Write-Host "`n==> $msg" -ForegroundColor Cyan }

# Replicates GNU Stow: creates file-level symlinks under $TargetPath mirroring $PackagePath.
function Invoke-Stow {
    param(
        [string]$PackagePath,
        [string]$TargetPath,
        [switch]$Unstow
    )
    Get-ChildItem -Path $PackagePath -Force | ForEach-Object {
        $src  = $_.FullName
        $dest = Join-Path $TargetPath $_.Name

        if ($_.PSIsContainer) {
            if (-not $Unstow -and -not (Test-Path $dest)) {
                if ($DryRun) { Write-Host "[dry-run] mkdir: $dest" -ForegroundColor Yellow }
                else { New-Item -ItemType Directory -Path $dest -Force | Out-Null }
            }
            Invoke-Stow -PackagePath $src -TargetPath $dest -Unstow:$Unstow
            # Remove empty dirs left behind after unstow.
            if ($Unstow -and (Test-Path $dest) -and (@(Get-ChildItem $dest -Force).Count -eq 0)) {
                if ($DryRun) { Write-Host "[dry-run] rmdir: $dest" -ForegroundColor Yellow }
                else { Remove-Item $dest -Force }
            }
        } else {
            if ($Unstow) {
                if (Test-Path $dest) {
                    $item = Get-Item $dest -Force -ErrorAction SilentlyContinue
                    if ($item -and $item.LinkType -eq "SymbolicLink") {
                        if ($DryRun) { Write-Host "[dry-run] Remove symlink: $dest" -ForegroundColor Yellow }
                        else { Remove-Item $dest -Force }
                    }
                }
            } else {
                $dir = Split-Path $dest
                if (-not (Test-Path $dir)) {
                    if ($DryRun) { Write-Host "[dry-run] mkdir: $dir" -ForegroundColor Yellow }
                    else { New-Item -ItemType Directory -Path $dir -Force | Out-Null }
                }
                if ($DryRun) {
                    Write-Host "[dry-run] Link: $dest -> $src" -ForegroundColor Yellow
                } else {
                    if (Test-Path $dest -PathType Any) { Remove-Item $dest -Force -Recurse }
                    cmd /c "mklink `"$dest`" `"$src`"" | Out-Null
                }
            }
        }
    }
}

# Verify symlink capability (requires Developer Mode).
Write-Step "Checking symlink support..."
$testSrc  = [System.IO.Path]::GetTempFileName()
$testLink = "$env:TEMP\dotfiles_symlink_test"
cmd /c "mklink `"$testLink`" `"$testSrc`"" | Out-Null
if ($LASTEXITCODE -ne 0) {
    Write-Host "ERROR: Cannot create symlinks.`nEnable Developer Mode: Settings -> System -> For developers." -ForegroundColor Red
    Remove-Item $testSrc -Force -ErrorAction SilentlyContinue
    exit 1
}
Remove-Item $testLink -Force -ErrorAction SilentlyContinue
Remove-Item $testSrc  -Force -ErrorAction SilentlyContinue

# Install Scoop (user-space package manager).
if (-not (Get-Command scoop -ErrorAction SilentlyContinue)) {
    Write-Step "Installing Scoop..."
    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
    Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
}

# Base dependencies.
Write-Step "Installing git..."
if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    scoop install git
}

# Clone or reset dotfiles repo via HTTPS (works for everyone).
# Push remote is set to SSH so the owner can push with git directly.
Write-Step "Setting up dotfiles repo..."
if (-not (Test-Path "$DOTDIR\.git")) {
    git clone $REPO_URL $DOTDIR
} else {
    Push-Location $DOTDIR
    git fetch origin
    git reset --hard origin/main
    git clean -fd
    git pull
    Pop-Location
}
git -C $DOTDIR remote set-url --push origin $SSH_PUSH

# Confirm before overwriting.
if (-not $DryRun) {
    Write-Host "`nWARNING: This will overwrite existing dotfiles with repo versions" -ForegroundColor Yellow
    $a = Read-Host "Continue? (y/N)"
    if ($a -notmatch '^[Yy]$') { exit 0 }
} else {
    Write-Host "`n=== DRY RUN — no files will be modified ===" -ForegroundColor Cyan
}

# Stow common/ into $HOME.
Write-Step "Stowing dotfiles..."
Invoke-Stow -PackagePath "$DOTDIR\common" -TargetPath $HOME -Unstow
Invoke-Stow -PackagePath "$DOTDIR\common" -TargetPath $HOME

# On Windows, Alacritty reads config from %APPDATA%\alacritty\ (not ~/.config/alacritty/).
# Use a junction (/j) — requires no elevation and no Developer Mode — so Alacritty
# finds the stowed config at both paths.
$alacrittyAppData = "$env:APPDATA\alacritty"
$alacrittyStowed  = "$HOME\.config\alacritty"
if (-not (Test-Path $alacrittyAppData)) {
    Write-Step "Linking Alacritty config into APPDATA..."
    if ($DryRun) {
        Write-Host "[dry-run] Junction: $alacrittyAppData -> $alacrittyStowed" -ForegroundColor Yellow
    } else {
        cmd /c "mklink /j `"$alacrittyAppData`" `"$alacrittyStowed`"" | Out-Null
    }
}

# Clone alacritty themes (external community repo, not tracked in dotfiles).
$themesDir = "$HOME\.config\alacritty\themes"
if (-not (Test-Path $themesDir)) {
    Write-Step "Cloning alacritty themes..."
    if ($DryRun) {
        Write-Host "[dry-run] git clone $ALACRITTY_THEMES $themesDir" -ForegroundColor Yellow
    } else {
        git clone $ALACRITTY_THEMES $themesDir
    }
}

# Optional Neovim.
Write-Step "Optional: Neovim config"
$answer = Read-Host "Install $NVIM_SSH`? THIS WILL DELETE YOUR NEOVIM CONFIGURATION. (y/N)"
if ($answer -match '^[Yy]$') {
    if ($DryRun) {
        Write-Host "[dry-run] scoop install neovim" -ForegroundColor Yellow
        Write-Host "[dry-run] git clone $NVIM_SSH $HOME\.config\nvim" -ForegroundColor Yellow
    } else {
        scoop install neovim
        $nvimDir = "$HOME\.config\nvim"
        Remove-Item -Recurse -Force $nvimDir -ErrorAction SilentlyContinue
        $cloned = $false
        try { git clone $NVIM_SSH $nvimDir; $cloned = $true } catch {}
        if (-not $cloned) { git clone $NVIM_HTTPS $nvimDir }
    }
}

Write-Host "`nDone!" -ForegroundColor Green
