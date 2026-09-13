# typed: false
# frozen_string_literal: true

# dune-server — the headless Dune workspace server (files, git, terminal over
# HTTP + WebSocket). Ships on the SAME release/version as the Dune IDE app.
class DuneServer < Formula
  desc "Headless Dune workspace server (files, git, terminal over HTTP/WS)"
  homepage "https://github.com/duneyou/dune"
  version "1.10.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/duneyou/dune/releases/download/v1.10.0/dune-server-darwin-arm64"
      sha256 "6e0ec066821b129241455104b00a7a5df530d43bc94df7834c2b255783b4bbbd"

      def install
        bin.install "dune-server-darwin-arm64" => "dune-server"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/duneyou/dune/releases/download/v1.10.0/dune-server-linux-x64"
      sha256 "238e8838269b33936fdd4add4e1dbe622835fb8002d64355428a14c3e934ac30"

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
