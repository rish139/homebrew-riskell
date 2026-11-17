# homebrew-riskell

A [Homebrew](https://brew.sh) tap for [riskell](https://github.com/rish139/riskell), a native macOS desktop shell.

```sh
brew tap rish139/riskell
brew install --HEAD riskell      # builds from source with Apple's Swift toolchain
risk install                     # start it now and at login
```

Needs macOS 14 or newer and the Command Line Tools (`xcode-select --install`). There is no tagged release yet, so the formula builds `main`
(`--HEAD`).

**Not usable yet from a clean machine:** riskell depends on the (still private) [riskell-kit](https://github.com/rish139/riskell-kit) by URL, and
Homebrew's build environment has no GitHub credentials, so the build cannot fetch it. It works once the kit and riskell are public. The install
layout (a keg holding the tree and the release build, with `risk` linked into the path) was checked by hand; the build inside Homebrew was not.
