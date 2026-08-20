class Fuzgit < Formula
  desc "TUI Git CLI tool with fuzzy search, written in Rust"
  homepage "https://hatohato25.github.io/fuzgit/"
  version "0.5.0"
  license "MIT"

  # 各 sha256 行末の "# <target>" は、fuzgit 側の build-and-publish.yml が
  # sed でアンカーとして参照する。順序に依存せず冪等に置換するための目印なので消さないこと。
  # 初回リリース前は実値が存在しないため 64 桁のゼロをプレースホルダとして置いている。
  # 初回リリース時にワークフローが実際の sha256 へ置き換える。
  on_macos do
    on_arm do
      url "https://github.com/hatohato25/fuzgit/releases/download/v#{version}/fuzgit-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "fdb208c14b8baf83c5414dbbb19c57c4e14c9dde3831dcf4fe5e306d3180ba93" # aarch64-apple-darwin
    end

    on_intel do
      url "https://github.com/hatohato25/fuzgit/releases/download/v#{version}/fuzgit-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "0dbd4855034df90bd4678bbbf0315e59523729b47e8cf025c47909166cb1b07c" # x86_64-apple-darwin
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/hatohato25/fuzgit/releases/download/v#{version}/fuzgit-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "37c673b67552d7e47b79f086875b3955d7f4b5d6a88c69541f75d88b42a637fd" # x86_64-unknown-linux-musl
    end
  end

  def install
    # パッケージ名は fuzgit だが、インストールされるコマンドは gz
    bin.install "gz"
  end

  test do
    system "#{bin}/gz", "--version"
  end
end
