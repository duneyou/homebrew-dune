# typed: false
# frozen_string_literal: true

# The Dune desktop app — the tish-ide build (Dune.app). The Tauri app is
# legacy and no longer ships.
cask "dune-ide" do
  version "1.7.4"

  on_arm do
    sha256 "d3964ac51f7beaa1e7cbc7e00b05b0c1d0bc42fad1c49a741f698f68673dd2a4"
    url "https://github.com/duneyou/dune/releases/download/v1.7.4/Dune-tish-darwin-arm64.dmg"
  end

  name "Dune"
  desc "AI-first desktop IDE"
  homepage "https://github.com/duneyou/dune"

  app "Dune.app"

  zap trash: [
    "~/Library/Application Support/Dune IDE",
    "~/Library/Preferences/com.dune.tish-ide.plist",
    "~/Library/Saved Application State/com.dune.tish-ide.savedState",
  ]
end
