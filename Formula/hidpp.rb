class Hidpp < Formula
  desc "Configure Logitech devices without Options+"
  homepage "https://github.com/jlevere/hidpp"
  url "https://github.com/jlevere/hidpp/archive/refs/tags/v0.3.2.tar.gz"
  sha256 "6adba40fba5d7f5431e751181f56724c39df5646759bad5130277ace3b5b0a7f"
  license any_of: ["MIT", "Apache-2.0"]

  depends_on "rust" => :build
  depends_on "pkg-config" => :build

  service do
    run [opt_bin/"hidppd"]
    keep_alive true
  end

  def install
    system "cargo", "build", "--release",
           "-p", "hidpp-cli",
           "-p", "hidpp-daemon"
    bin.install "target/release/hidpp"
    bin.install "target/release/hidppd"
  end

  def caveats
    <<~EOS
      Grant permissions in System Settings → Privacy & Security:
        - Input Monitoring (for HID device access)
        - Accessibility (for keystroke injection)

      Start the menu bar app:
        brew services start hidpp

      Configure gestures and button actions:
        ~/.config/hidpp/config.toml
    EOS
  end

  test do
    assert_match "hidpp", shell_output("#{bin}/hidpp --help")
  end
end
