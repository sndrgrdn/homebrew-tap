cask "gary" do
  version "0.8.0"
  sha256 "a92067b72bcdd4b6556a36dc69bbf5db964ac62ae3d97cf4813324dd6b3efcd2"

  url "https://github.com/sndrgrdn/gary/releases/download/v#{version}/Gary-#{version}.zip"
  name "Gary"
  desc "Shell that draws a bar, panels, overlays and menus from TypeScript plugins"
  homepage "https://github.com/sndrgrdn/gary"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "Gary.app"
  binary "#{appdir}/Gary.app/Contents/MacOS/gary"

  uninstall quit: "com.sndrgrdn.gary"

  zap trash: [
    "~/Library/Application Support/Gary",
    "~/Library/Logs/gary.log",
  ]

  caveats <<~EOS
    To start Gary at login and start it now, run:
      gary login on
      open -a Gary
  EOS
end
