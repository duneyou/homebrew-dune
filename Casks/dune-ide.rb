# typed: false
# frozen_string_literal: true

# The Dune desktop app — the tish-ide build (Dune.app). The Tauri app is
# legacy and no longer ships.
cask "dune-ide" do
  version "1.7.2"

  on_arm do
    sha256 "535f9192f9f09e442f2104c9d17b32d02735d5f38d87d90734626066bb627098"
    url "https://github.com/duneyou/dune/releases/download/v1.7.2/Dune-tish-darwin-arm64.dmg"
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
