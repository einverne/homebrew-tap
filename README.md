# einverne/homebrew-tap

einverne 的 Homebrew tap。

## GrapeClip

[GrapeClip](https://grapeclip.com) 是一款端到端加密的跨平台剪贴板同步工具。安装包来自 [einverne/grapeclip-releases](https://github.com/einverne/grapeclip-releases/releases)。

```bash
# 内测版（含预发布版本）
brew install --cask einverne/tap/grapeclip@beta

# 正式版（首个正式版发布后可用）
brew install --cask einverne/tap/grapeclip
```

两个 cask 安装的是同一个 `GrapeClip.app`，互相冲突，只能装其中一个。应用内置自动更新，
所以 `brew upgrade` 默认会跳过它，需要时用 `brew upgrade --cask --greedy grapeclip@beta`。

彻底卸载并清理本地数据：

```bash
brew uninstall --cask --zap grapeclip@beta
```

Cask 由 GrapeClip 的发布流水线自动更新，请不要手工修改。
