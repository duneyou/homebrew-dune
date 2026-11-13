# typed: false
# frozen_string_literal: true

# dune-server — the headless Dune workspace server (files, git, terminal over
# HTTP + WebSocket). Ships on the SAME release/version as the Dune IDE app.
class DuneServer < Formula
  desc "Headless Dune workspace server (files, git, terminal over HTTP/WS)"
  homepage "https://github.com/duneyou/dune"
  version "1.52.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/duneyou/dune/releases/download/v1.52.4/dune-server-darwin-arm64"
      sha256 "446352b5570c665b1f33d31c1d8ce2032fb4fa873d012394b836ac4b83d4629c"

      def install
        bin.install "dune-server-darwin-arm64" => "dune-server"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/duneyou/dune/releases/download/v1.52.4/dune-server-linux-x64"
      sha256 "11a7312625c308b7289f35a2d2dca159918219dc373d47cb4ccc6b94740167e4"

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
      or connect the Dune Remote app. An access token is always required: it is
      printed at startup and kept in ~/.dune/server-token (or pass --token <t>).
      --web-root <dist> serves a different build.
    EOS
  end

  test do
    assert_predicate bin/"dune-server", :executable?
  end
end
