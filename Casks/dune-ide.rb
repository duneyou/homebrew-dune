# typed: false
# frozen_string_literal: true

# The Dune desktop app — the tish-ide build (Dune.app). The Tauri app is
# legacy and no longer ships.
cask "dune-ide" do
  version "1.49.1"

  on_arm do
    sha256 "8f6d9a03b250d0fb3c3c4cc2003c9df2acbcf680c809388a34d2fe42b64d4859"
    url "https://github.com/duneyou/dune/releases/download/v1.49.1/Dune-tish-darwin-arm64.dmg"
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
