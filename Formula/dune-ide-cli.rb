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
  version "1.8.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/duneyou/dune/releases/download/v1.8.0/dune-darwin-arm64"
      sha256 "b05c34d39ffec0cc7ed3b132f99b7ad11f3e2f7cb9ff727f435e7d6ac6cc5fb8"

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
