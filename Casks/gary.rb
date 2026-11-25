cask "gary" do
  version "0.6.1"
  sha256 "4c274eda3db2f90f6925a5a43fd84987fec78e131c43b5b4d11f9adfddc426f0"

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
