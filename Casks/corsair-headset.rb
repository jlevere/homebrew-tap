cask "corsair-headset" do
  version "0.8.0"
  sha256 "5e6eed6b7193523a9c731777a5d234ffaee8ebcad2c3a8d99fd0dd4883d639d4"

  url "https://github.com/jlevere/corsair-headset/releases/download/v#{version}/Corsair-Headset-#{version}.dmg"
  name "Corsair Headset"
  desc "macOS menu bar app for Corsair wireless headsets"
  homepage "https://github.com/jlevere/corsair-headset"

  app "Corsair Headset.app"

  zap trash: [
    "~/Library/Application Support/Corsair Headset",
  ]
end
