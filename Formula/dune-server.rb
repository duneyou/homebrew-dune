# typed: false
# frozen_string_literal: true

# dune-server — the headless Dune workspace server (files, git, terminal over
# HTTP + WebSocket). Ships on the SAME release/version as the Dune IDE app.
class DuneServer < Formula
  desc "Headless Dune workspace server (files, git, terminal over HTTP/WS)"
  homepage "https://github.com/duneyou/dune"
  version "1.5.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/duneyou/dune/releases/download/v1.5.2/dune-server-darwin-arm64"
      sha256 "be54517549bc61850faa7dd333f105b9ac30a5608b407a3b0235de49299a0d51"

      def install
        bin.install "dune-server-darwin-arm64" => "dune-server"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/duneyou/dune/releases/download/v1.5.2/dune-server-linux-x64"
      sha256 "d528853e237b87b93a8f1d8765fb5bf1259bfddd6bb76fd2d3ffd5fea0b9cce7"

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
