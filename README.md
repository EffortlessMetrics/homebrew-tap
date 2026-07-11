# EffortlessMetrics Homebrew Tap

Homebrew tap for EffortlessMetrics tools.

## Install shiplog

`shiplog` is distributed through this owned EffortlessMetrics tap, not
Homebrew/core.

```bash
brew install effortlessmetrics/tap/shiplog
```

The formula currently supports Intel and Apple Silicon macOS plus Intel Linux
using the release assets from the Shiplog GitHub release. Linux ARM64 users
should use the versionless direct installer until a matching Linux ARM release
asset is published.

Verify the installation:

```bash
shiplog --version
```

## Install perllsp

`perllsp` is distributed through this owned EffortlessMetrics tap, not Homebrew/core.

```bash
brew install effortlessmetrics/tap/perllsp
```

Equivalent two-step form:

```bash
brew tap effortlessmetrics/tap
brew install perllsp
```

## Verify

```bash
perllsp --version
perllsp --health
perl-dap --version
```

## What this installs

* `perllsp` - Perl language server binary
* `perl-dap` - Perl debug adapter binary

## Supported Homebrew platforms

The formula currently uses the release `gnu` / glibc Linux assets for Linuxbrew and the Darwin assets for macOS:

| Platform | Release asset suffix |
| --- | --- |
| macOS Apple Silicon | `aarch64-apple-darwin` |
| macOS Intel | `x86_64-apple-darwin` |
| Linux ARM64 / aarch64 | `aarch64-unknown-linux-gnu` |
| Linux x64 / AMD64 | `x86_64-unknown-linux-gnu` |

For Alpine Linux or musl-based containers, use the manual GitHub Release asset instead of this Homebrew formula.

## Upgrade

```bash
brew update
brew upgrade perllsp
```

## Notes

`brew install perl-lsp` is not supported. Use `brew install effortlessmetrics/tap/perllsp`.

Maintainer publishing expectations are documented in [docs/TAP_PUBLISHING.md](docs/TAP_PUBLISHING.md).
