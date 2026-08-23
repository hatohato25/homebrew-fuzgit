class Fuzgit < Formula
  desc "TUI Git CLI tool with fuzzy search, written in Rust"
  homepage "https://hatohato25.github.io/fuzgit/"
  version "0.6.0"
  license "MIT"

  # 各 sha256 行末の "# <target>" は、fuzgit 側の build-and-publish.yml が
  # sed でアンカーとして参照する。順序に依存せず冪等に置換するための目印なので消さないこと。
  # 初回リリース前は実値が存在しないため 64 桁のゼロをプレースホルダとして置いている。
  # 初回リリース時にワークフローが実際の sha256 へ置き換える。
  on_macos do
    on_arm do
      url "https://github.com/hatohato25/fuzgit/releases/download/v#{version}/fuzgit-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "7395ef4e484a110ec84d4afa6c899473c96c8990d1d657302f7cfeff27a87a8c" # aarch64-apple-darwin
    end

    on_intel do
      url "https://github.com/hatohato25/fuzgit/releases/download/v#{version}/fuzgit-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "68f00cea3061a5c7fa968f685f88132d14b145659bcb122dff6afe334e364b03" # x86_64-apple-darwin
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/hatohato25/fuzgit/releases/download/v#{version}/fuzgit-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "67d337bf535951354ce6df6cf554e02b94e7acaefeb4791bfd28a8b607915127" # x86_64-unknown-linux-musl
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
