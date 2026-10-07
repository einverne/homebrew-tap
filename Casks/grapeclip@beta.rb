cask "grapeclip@beta" do
  arch arm: "aarch64", intel: "x64"

  version "0.0.2-rc.1,0.0.2"
  sha256 arm:   "c1394542d62bbd4c76d8e9bd7abbd7f5f00bdb9214f8adaf596e20e9f5aa6447",
         intel: "1dc0be7e470f96e43a545df0daccc06f2343fec8974fde4f8a21887daca2e31f"

  url "https://github.com/einverne/grapeclip-releases/releases/download/v#{version.csv.first}/GrapeClip_#{version.csv.second}_#{arch}.dmg"
  name "GrapeClip"
  desc "End-to-end encrypted clipboard manager with cross-device sync"
  homepage "https://grapeclip.com/"

  livecheck do
    url :url
    regex(/^v?(\d+(?:\.\d+)+)(-[\w.]+)?$/i)
    strategy :github_releases do |json, regex|
      json.map do |release|
        next if release["draft"]

        match = release["tag_name"]&.match(regex)
        next if match.blank?

        match[2] ? "#{match[1]}#{match[2]},#{match[1]}" : match[1]
      end
    end
  end

  auto_updates true
  conflicts_with cask: "grapeclip"
  depends_on :macos

  app "GrapeClip.app"

  zap trash: [
    "~/Library/Application Support/com.grapeclip.desktop",
    "~/Library/LaunchAgents/GrapeClip.plist",
    "~/Library/Preferences/com.grapeclip.desktop.plist",
    "~/Library/Preferences/GrapeClip.plist",
    "~/Library/WebKit/com.grapeclip.desktop",
    "~/Library/WebKit/GrapeClip",
  ]
end
