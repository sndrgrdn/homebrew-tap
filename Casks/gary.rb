cask "gary" do
  version "0.7.0"
  sha256 "cc2a6650c05114ad471d8d05de57d8f6e7967b708c7f1e84165e61c40cd647a9"

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
