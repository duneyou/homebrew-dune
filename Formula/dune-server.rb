# typed: false
# frozen_string_literal: true

# dune-server — the headless Dune workspace server (files, git, terminal over
# HTTP + WebSocket). Ships on the SAME release/version as the Dune IDE app.
class DuneServer < Formula
  desc "Headless Dune workspace server (files, git, terminal over HTTP/WS)"
  homepage "https://github.com/duneyou/dune"
  version "1.5.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/duneyou/dune/releases/download/v1.5.12/dune-server-darwin-arm64"
      sha256 "79a11d72ce15d864de7bd7453710a5c0a21f48fadc0e8c9cd74dd78a2e661394"

      def install
        bin.install "dune-server-darwin-arm64" => "dune-server"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/duneyou/dune/releases/download/v1.5.12/dune-server-linux-x64"
      sha256 "f5194f0685271b29a6e512ec7d935b1ecf890d9c49b3dc791e84373bd8bc9a58"

      def install
        bin.install "dune-server-linux-x64" => "dune-server"
      end
    end
  end

  def caveats
    <<~EOS
      The /pty WebSocket (interactive terminal) requires:
        TISH_HTTP_BACKEND=hyper dune-server --workspace <dir>
    EOS
  end

  test do
    assert_predicate bin/"dune-server", :executable?
  end
end
