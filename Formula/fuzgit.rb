class Fuzgit < Formula
  desc "TUI Git CLI tool with fuzzy search, written in Rust"
  homepage "https://hatohato25.github.io/fuzgit/"
  version "0.11.0"
  license "MIT"

  # 各 sha256 行末の "# <target>" は、fuzgit 側の build-and-publish.yml が
  # sed でアンカーとして参照する。順序に依存せず冪等に置換するための目印なので消さないこと。
  # 初回リリース前は実値が存在しないため 64 桁のゼロをプレースホルダとして置いている。
  # 初回リリース時にワークフローが実際の sha256 へ置き換える。
  on_macos do
    on_arm do
      url "https://github.com/hatohato25/fuzgit/releases/download/v#{version}/fuzgit-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "5e0270c6baf757b2e875c58c3fb036a27528b7bb9fadae757da54546efbf6de2" # aarch64-apple-darwin
    end

    on_intel do
      url "https://github.com/hatohato25/fuzgit/releases/download/v#{version}/fuzgit-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "7223eca6124659b0cb4e953660887490b352ec328591b1aec7cb89e63fbd87fa" # x86_64-apple-darwin
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/hatohato25/fuzgit/releases/download/v#{version}/fuzgit-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "60a60ae6c41ee766181a7d567f623605f0e08c82a93389317882b3f3ae2fbf69" # x86_64-unknown-linux-musl
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
