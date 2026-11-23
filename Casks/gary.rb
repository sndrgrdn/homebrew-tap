cask "gary" do
  version "0.4.0"
  sha256 "f02395e7eff3b2f39386c4fa1545d96b3c679c28d5f1b49558d8416929c28312"

  url "https://github.com/sndrgrdn/gary/releases/download/v#{version}/Gary-#{version}.zip"
  name "Gary"
  desc "Shell that draws a bar, panels, overlays and menus from TypeScript plugins"
  homepage "https://github.com/sndrgrdn/gary"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :golden_gate

  app "Gary.app"
  binary "#{appdir}/Gary.app/Contents/MacOS/gary"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Gary.app"]
  end

  uninstall quit: "com.sndrgrdn.gary"

  zap trash: [
    "~/Library/Application Support/Gary",
    "~/Library/Logs/gary.log",
  ]

  caveats <<~EOS
    Gary is signed with a local certificate and is not notarized.
    This cask removes the quarantine attribute so that macOS opens it.

    To start Gary at login and start it now, run:
      gary login on
      open -a Gary
  EOS
end
