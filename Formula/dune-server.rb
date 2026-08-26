# typed: false
# frozen_string_literal: true

# dune-server — the headless Dune workspace server (files, git, terminal over
# HTTP + WebSocket). Ships on the SAME release/version as the Dune IDE app.
class DuneServer < Formula
  desc "Headless Dune workspace server (files, git, terminal over HTTP/WS)"
  homepage "https://github.com/duneyou/dune"
  version "1.5.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/duneyou/dune/releases/download/v1.5.4/dune-server-darwin-arm64"
      sha256 "8694088d7aa6f7145cd9569e502b612a1a44b153436e3b041a148f69006883fa"

      def install
        bin.install "dune-server-darwin-arm64" => "dune-server"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/duneyou/dune/releases/download/v1.5.4/dune-server-linux-x64"
      sha256 "f95489b31ef58143e50821498228dd818a0bfe01540943bd86a62816218f9f69"

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
