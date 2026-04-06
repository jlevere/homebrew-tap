class CorsairHeadset < Formula
  desc "macOS menu bar app for Corsair wireless headsets"
  homepage "https://github.com/jlevere/corsair-headset"
  url "https://github.com/jlevere/corsair-headset/archive/refs/tags/v0.8.0.tar.gz"
  sha256 "54986fb8158b1641e3d788755047f91d5a09683fac0447c363d6207ee2c4e367"
  head "https://github.com/jlevere/corsair-headset.git", branch: "main"

  depends_on "rust" => :build
  depends_on "pkg-config" => :build
  depends_on "hidapi"

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/corsair-tray")
    system "cargo", "install", *std_cargo_args(path: "crates/corsair-cli")
  end

  service do
    run opt_bin/"corsair-tray"
    keep_alive true
    log_path var/"log/corsair-headset.log"
    error_log_path var/"log/corsair-headset.log"
  end

  def caveats
    <<~EOS
      To start at login:
        brew services start corsair-headset

      To stop:
        brew services stop corsair-headset
    EOS
  end
end
