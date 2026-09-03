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
  version "1.7.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/duneyou/dune/releases/download/v1.7.3/dune-darwin-arm64"
      sha256 "6e133a24571836d0a752f2f67ad007a19aaade9af12e823a579d29804e8428c1"

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
