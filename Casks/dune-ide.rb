# typed: false
# frozen_string_literal: true

# The Dune desktop app — the tish-ide build (Dune.app). The Tauri app is
# legacy and no longer ships.
cask "dune-ide" do
  version "1.5.9"

  on_arm do
    sha256 "ef39a8c8f49199c00fc1ac2ce64259404965247c1e1045db67f851116e1a6e0e"
    url "https://github.com/duneyou/dune/releases/download/v1.5.9/Dune-tish-darwin-arm64.dmg"
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
