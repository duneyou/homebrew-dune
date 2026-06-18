# typed: false
# frozen_string_literal: true

# Installs the `dune` command line launcher for Dune IDE.
#
# Named `dune-ide-cli` to avoid clashing with Homebrew core's OCaml `dune`.
# The installed binary is still `dune`; if you also use the OCaml build tool,
# manage which one wins on PATH (e.g. `brew unlink dune`).
class DuneIdeCli < Formula
  desc "Dune IDE command line launcher (the `dune` command)"
  homepage "https://github.com/duneyou/dune"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/duneyou/dune/releases/download/v0.1.0/dune-darwin-arm64"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"

      def install
        bin.install "dune-darwin-arm64" => "dune"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/duneyou/dune/releases/download/v0.1.0/dune-darwin-x64"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"

      def install
        bin.install "dune-darwin-x64" => "dune"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/duneyou/dune/releases/download/v0.1.0/dune-linux-arm64"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"

      def install
        bin.install "dune-linux-arm64" => "dune"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/duneyou/dune/releases/download/v0.1.0/dune-linux-x64"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"

      def install
        bin.install "dune-linux-x64" => "dune"
      end
    end
  end

  test do
    assert_predicate bin/"dune", :executable?
    # The launcher forwards to the IDE; with no app installed it exits 127 with
    # a helpful message that mentions Dune IDE.
    output = shell_output("#{bin}/dune --version 2>&1", 127)
    assert_match "Dune IDE", output
  end
end
