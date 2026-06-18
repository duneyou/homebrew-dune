# typed: false
# frozen_string_literal: true

# Installs the Dune IDE desktop app and links the bundled `dune` launcher onto
# PATH, mirroring VS Code's `code` command.
cask "dune-ide" do
  version "0.1.0"

  on_arm do
    sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    url "https://github.com/duneedit/dune/releases/download/v#{version}/Dune-IDE-darwin-arm64.dmg"
  end
  on_intel do
    sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    url "https://github.com/duneedit/dune/releases/download/v#{version}/Dune-IDE-darwin-x64.dmg"
  end

  name "Dune IDE"
  desc "AI-first desktop IDE"
  homepage "https://github.com/duneedit/dune"

  app "Dune IDE.app"

  # Link the bundled launcher so `dune` works from any terminal.
  binary "#{appdir}/Dune IDE.app/Contents/Resources/bin/dune", target: "dune"

  zap trash: [
    "~/Library/Application Support/Dune IDE",
    "~/Library/Preferences/com.dune.ide.plist",
    "~/Library/Saved Application State/com.dune.ide.savedState",
  ]
end
