# typed: false
# frozen_string_literal: true

# The Dune desktop app — the tish-ide build (Dune.app). The Tauri app is
# legacy and no longer ships.
cask "dune-ide" do
  version "1.5.2"

  on_arm do
    sha256 "e972953fc5ac8128e7652b45a3a2f364742ce1743838f4f1334d472cd6c3ae18"
    url "https://github.com/duneyou/dune/releases/download/v1.5.2/Dune-tish-darwin-arm64.dmg"
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
