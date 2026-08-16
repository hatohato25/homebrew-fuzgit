# homebrew-fuzgit

Homebrew tap for [fuzgit](https://github.com/hatohato25/fuzgit) — a git CLI built around picking,
searching, and tracing with a fuzzy finder.

The package name is `fuzgit`, but **the installed command is `gz`**.

## Install

```sh
brew install hatohato25/fuzgit/fuzgit
```

Or tap first, then install:

```sh
brew tap hatohato25/fuzgit
brew install fuzgit
```

## Upgrade

```sh
brew update
brew upgrade fuzgit
```

## Uninstall

```sh
brew uninstall fuzgit
brew untap hatohato25/fuzgit
```

## Supported platforms

| OS | Architecture | Target |
|---|---|---|
| macOS | Apple Silicon | `aarch64-apple-darwin` |
| macOS | Intel | `x86_64-apple-darwin` |
| Linux | x86_64 | `x86_64-unknown-linux-musl` |

## Note

`Formula/fuzgit.rb` is updated automatically by the `build-and-publish` workflow in the
[fuzgit](https://github.com/hatohato25/fuzgit) repository whenever a release is published.
Do not edit the `version` / `sha256` lines by hand.

---

## 日本語

[fuzgit](https://github.com/hatohato25/fuzgit)（fuzzy finder で「選ぶ」「探す」「辿る」git 操作 CLI ツール）
の Homebrew tap です。パッケージ名は `fuzgit` ですが、**インストールされるコマンドは `gz`** です。

```sh
brew install hatohato25/fuzgit/fuzgit
gz --help
```

`Formula/fuzgit.rb` はリリース時に fuzgit 側のワークフローが自動更新するため、
`version` / `sha256` 行を手で編集しないでください。
