# typed: false
# frozen_string_literal: true

# dune-server — the headless Dune workspace server (files, git, terminal over
# HTTP + WebSocket). Ships on the SAME release/version as the Dune IDE app.
class DuneServer < Formula
  desc "Headless Dune workspace server (files, git, terminal over HTTP/WS)"
  homepage "https://github.com/duneyou/dune"
  version "1.39.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/duneyou/dune/releases/download/v1.39.2/dune-server-darwin-arm64"
      sha256 "fe07310204a97013ce535f9a5760cae1f69d6da7cac149a938f4c99c7ec61c64"

      def install
        bin.install "dune-server-darwin-arm64" => "dune-server"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/duneyou/dune/releases/download/v1.39.2/dune-server-linux-x64"
      sha256 "49dadc1abfe9ccff6c18f4ab263c9804c40bb9b09bcb7db306628f9f68a68d43"

      def install
        bin.install "dune-server-linux-x64" => "dune-server"
      end
    end
  end

  def caveats
    <<~EOS
      The /pty WebSocket (interactive terminal) requires:
        TISH_HTTP_BACKEND=hyper dune-server --workspace <dir>

      The web workbench is built in: open http://127.0.0.1:8787/ in a browser
      or connect the Dune Remote app (pass --token <t> beyond localhost;
      --web-root <dist> serves a different build).
    EOS
  end

  test do
    assert_predicate bin/"dune-server", :executable?
  end
end
