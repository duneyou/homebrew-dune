# typed: false
# frozen_string_literal: true

# Installs the `dune` command line launcher for Dune (the tish-ide app).
#
# Named `dune-ide-cli` to avoid clashing with Homebrew core's OCaml `dune`.
# The installed binary is still `dune`; if you also use the OCaml build tool,
# manage which one wins on PATH (e.g. `brew unlink dune`).
class DuneIdeCli < Formula
  desc "Dune IDE command line launcher (the `dune` command)"
  homepage "https://github.com/duneyou/dune"
  version "1.52.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/duneyou/dune/releases/download/v1.52.4/dune-darwin-arm64"
      sha256 "65d1e0cabe97193add7d532910faac5bc7538e45adebf7d441667c90ae9196d9"

      def install
        bin.install "dune-darwin-arm64" => "dune"
      end
    end
  end

  test do
    assert_predicate bin/"dune", :executable?
    output = shell_output("#{bin}/dune --version 2>&1", 127)
    assert_match "Dune", output
  end
end
