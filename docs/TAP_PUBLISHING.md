# Tap Publishing Contract

This repository is the owned Homebrew tap for EffortlessMetrics tools.

## Identity

| Item | Value |
| --- | --- |
| Tap repository | `EffortlessMetrics/homebrew-tap` |
| Tap name | `effortlessmetrics/tap` |
| Formula path | `Formula/<formula>.rb` |
| User install command | `brew install effortlessmetrics/tap/<formula>` |

Do not document `brew install <formula>` unless the preceding step explicitly tells the user to run:

```bash
brew tap effortlessmetrics/tap
```

Do not present formulas in this tap as Homebrew/core formulas.

## perllsp

The `perllsp` formula is the canonical Homebrew formula for the Perl language server and debug adapter:

```bash
brew install effortlessmetrics/tap/perllsp
```

It installs:

* `perllsp`
* `perl-dap`

`brew install perl-lsp` is not supported.

## Automation

The source repository owns release automation. For `perllsp`, that repository is:

```text
EffortlessMetrics/perl-lsp
```

The release automation updates this tap using:

```text
HOMEBREW_TAP_TOKEN
```

Required token scope:

| Permission | Access |
| --- | --- |
| Contents | Read/write |
| Pull requests | Read/write |
| Metadata | Read |

The token should not need Issues or label metadata permissions.

## Release Assets

Homebrew formulas in this tap should use macOS assets and GNU/glibc Linux assets:

| Platform | Release asset suffix |
| --- | --- |
| macOS Apple Silicon | `aarch64-apple-darwin` |
| macOS Intel | `x86_64-apple-darwin` |
| Linux ARM64 / aarch64 | `aarch64-unknown-linux-gnu` |
| Linux x64 / AMD64 | `x86_64-unknown-linux-gnu` |

Required release inputs:

* Darwin tarballs
* GNU/glibc Linux tarballs
* `SHA256SUMS`

Do not use musl Linux assets in the Homebrew formula. Alpine Linux and musl-based container users should install the matching manual GitHub Release asset instead.

## Formula Expectations

Formula updates should preserve these properties:

* formula names match the installed command when practical
* source URLs point to release assets from the owning source repository
* checksums come from the release `SHA256SUMS` file
* Linuxbrew uses GNU/glibc assets
* formula tests verify the installed command binaries
* public docs use tap-qualified install commands

For `perllsp`, the source repository generates the formula through `cargo xtask update-homebrew`.
