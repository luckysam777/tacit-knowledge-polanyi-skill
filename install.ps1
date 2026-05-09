param(
    [ValidateSet("codex", "openclaw", "claude-code", "hermes", "all")]
    [string]$Target = "codex",

    [string]$Dest
)

$ErrorActionPreference = "Stop"

$RootDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$SkillName = "tacit-knowledge-polanyi"

function Show-Usage {
    @"
Usage:
  .\install.ps1 [-Target codex|openclaw|claude-code|hermes|all] [-Dest PATH]

Examples:
  .\install.ps1
  .\install.ps1 -Target openclaw
  .\install.ps1 -Target claude-code
  .\install.ps1 -Target hermes -Dest "$HOME\.hermes\skills"
  .\install.ps1 -Target all

Rules:
  - Default target is codex
  - -Dest is only valid when installing a single target
  - Existing target skill directories are replaced
"@
}

function Copy-Skill {
    param(
        [Parameter(Mandatory = $true)][string]$SourceDir,
        [Parameter(Mandatory = $true)][string]$BaseDest
    )

    $FinalDest = Join-Path $BaseDest $SkillName
    New-Item -ItemType Directory -Force -Path $BaseDest | Out-Null

    if (Test-Path $FinalDest) {
        Remove-Item -Recurse -Force $FinalDest
    }

    Copy-Item -Recurse -Force $SourceDir $FinalDest
    Write-Host "Installed $SkillName -> $FinalDest"
}

function Install-Codex {
    $DestPath = if ($Dest) { $Dest } else { Join-Path $HOME ".codex\skills" }
    Copy-Skill -SourceDir (Join-Path $RootDir $SkillName) -BaseDest $DestPath
}

function Install-OpenClaw {
    $DestPath = if ($Dest) { $Dest } else { Join-Path $HOME ".openclaw\skills" }
    Copy-Skill -SourceDir (Join-Path $RootDir "platforms\openclaw\$SkillName") -BaseDest $DestPath
}

function Install-ClaudeCode {
    $DestPath = if ($Dest) { $Dest } else { Join-Path $HOME ".claude\skills" }
    Copy-Skill -SourceDir (Join-Path $RootDir "platforms\claude-code\$SkillName") -BaseDest $DestPath
}

function Install-Hermes {
    $DestPath = if ($Dest) { $Dest } else { Join-Path $HOME ".hermes\skills" }
    Copy-Skill -SourceDir (Join-Path $RootDir "platforms\hermes\$SkillName") -BaseDest $DestPath
    Write-Host "Hermes note: verify that $DestPath matches your local Hermes skill directory."
}

if ($Target -eq "all" -and $Dest) {
    Write-Error "-Dest cannot be used with -Target all"
}

switch ($Target) {
    "codex" { Install-Codex }
    "openclaw" { Install-OpenClaw }
    "claude-code" { Install-ClaudeCode }
    "hermes" { Install-Hermes }
    "all" {
        Install-Codex
        Install-OpenClaw
        Install-ClaudeCode
        Install-Hermes
    }
    default {
        Show-Usage
        exit 1
    }
}

Write-Host "Restart the target agent after installation."
