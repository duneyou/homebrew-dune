# typed: false
# frozen_string_literal: true

# dune-server — the headless Dune workspace server (files, git, terminal over
# HTTP + WebSocket). Ships on the SAME release/version as the Dune IDE app.
class DuneServer < Formula
  desc "Headless Dune workspace server (files, git, terminal over HTTP/WS)"
  homepage "https://github.com/duneyou/dune"
  version "1.9.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/duneyou/dune/releases/download/v1.9.0/dune-server-darwin-arm64"
      sha256 "061c919826d4258308a2bb9db393e005f94a7de28b4d1b416da2e273c92843dc"

      def install
        bin.install "dune-server-darwin-arm64" => "dune-server"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/duneyou/dune/releases/download/v1.9.0/dune-server-linux-x64"
      sha256 "88fdf5eefe89f2cae7b62654cbdc1c56c96bf428dcd79e23cea72263e7f02867"

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
