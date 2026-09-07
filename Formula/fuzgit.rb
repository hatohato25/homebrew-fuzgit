class Fuzgit < Formula
  desc "TUI Git CLI tool with fuzzy search, written in Rust"
  homepage "https://hatohato25.github.io/fuzgit/"
  version "0.12.0"
  license "MIT"

  # 各 sha256 行末の "# <target>" は、fuzgit 側の build-and-publish.yml が
  # sed でアンカーとして参照する。順序に依存せず冪等に置換するための目印なので消さないこと。
  # 初回リリース前は実値が存在しないため 64 桁のゼロをプレースホルダとして置いている。
  # 初回リリース時にワークフローが実際の sha256 へ置き換える。
  on_macos do
    on_arm do
      url "https://github.com/hatohato25/fuzgit/releases/download/v#{version}/fuzgit-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "2c10d6d5b1221a7163ff2a3954c30097f480ae8ee0e05710e995be73b2675530" # aarch64-apple-darwin
    end

    on_intel do
      url "https://github.com/hatohato25/fuzgit/releases/download/v#{version}/fuzgit-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "c871699fe31579358c7d3255d60704605feab23f03439c36a0c5820a9ef0b15b" # x86_64-apple-darwin
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/hatohato25/fuzgit/releases/download/v#{version}/fuzgit-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "26dc49139a761b2e6881135ec5dbbc4846f012ab85902c42c9be7921bb886a70" # x86_64-unknown-linux-musl
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
