class Riskell < Formula
  desc "Native macOS desktop shell: bars, hover cards and an extension kit"
  homepage "https://github.com/rish139/riskell"
  license "FSL-1.1-MIT"
  url "https://github.com/rish139/riskell/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "5e04536d07a79d50d3d9c1f04bd059a90ee03c8c60590affbef19f743846de7e"
  head "https://github.com/rish139/riskell.git", branch: "main"

  depends_on macos: :sonoma

  # riskell is built from source with Apple's Swift toolchain (the Command Line Tools are enough). `risk` runs the release build in place as a
  # launchd agent, so the whole tree is kept in libexec and `risk` is linked into the path.
  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    libexec.install Dir["*"]
    (libexec/".build/release").mkpath
    %w[riskell riskell-ext riskell-setup libnowplaying.dylib].each { |f| (libexec/".build/release").install ".build/release/#{f}" }
    bin.install_symlink libexec/"scripts/risk"
    bin.install_symlink libexec/"install.sh" => "riskell-install"
  end

  def caveats
    <<~EOS
      Start riskell now and at login:
        risk install
      or run the guided installer (window manager, theme, bars):
        riskell-install
      riskell is tuned to the font Geist Mono (without it macOS substitutes another and widths change):
        brew install --cask font-geist-mono
      `risk` is the control script: `risk help` lists its commands and `risk status` checks the install. After an upgrade run `risk install` again: the agent points into the keg.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/risk version")
    assert_match "extensions", shell_output("#{bin}/risk help ext")
  end
end
