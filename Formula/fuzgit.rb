class Fuzgit < Formula
  desc "TUI Git CLI tool with fuzzy search, written in Rust"
  homepage "https://hatohato25.github.io/fuzgit/"
  version "0.1.0"
  license "MIT"

  # 各 sha256 行末の "# <target>" は、fuzgit 側の build-and-publish.yml が
  # sed でアンカーとして参照する。順序に依存せず冪等に置換するための目印なので消さないこと。
  # 初回リリース前は実値が存在しないため 64 桁のゼロをプレースホルダとして置いている。
  # 初回リリース時にワークフローが実際の sha256 へ置き換える。
  on_macos do
    on_arm do
      url "https://github.com/hatohato25/fuzgit/releases/download/v#{version}/fuzgit-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "15abc1fd437ec69aa072055578b74611346c60f4ba13fe1e2a9d21415d8fe69b" # aarch64-apple-darwin
    end

    on_intel do
      url "https://github.com/hatohato25/fuzgit/releases/download/v#{version}/fuzgit-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "fe45a092ef029e634fc32914ce1a91247fc266cb850208c2b8b92ff2f9d33624" # x86_64-apple-darwin
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/hatohato25/fuzgit/releases/download/v#{version}/fuzgit-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "37432d1b88a02520881c5ba44123a792c134d84f187e5336fe8780c2fc6ae481" # x86_64-unknown-linux-musl
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
