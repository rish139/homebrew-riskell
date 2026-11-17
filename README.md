# homebrew-riskell

A [Homebrew](https://brew.sh) tap for [riskell](https://github.com/rish139/riskell), a native macOS desktop shell.

```sh
brew tap rish139/riskell
brew trust rish139/riskell      # Homebrew 7 and later refuses an untrusted third-party tap; skip this on older versions
brew install riskell            # the latest release, built from source with Apple's Swift toolchain
brew install --HEAD riskell     # or the main branch
risk install                    # start it now and at login
```

Needs macOS 14 or newer on Apple silicon and the Command Line Tools (`xcode-select --install`). riskell is tuned to the font Geist Mono
(`brew install --cask font-geist-mono`). The formula keeps the whole tree and the release build in the keg and links `risk` into your path; after
an upgrade run `risk install` again, because the launch agent points into the keg.
