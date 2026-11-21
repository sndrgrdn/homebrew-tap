cask "gary" do
  version "0.3.0"
  sha256 "3f0934bda568cc9d7c0be9137482c295b5fa50ff6a5defef9e22c17fc161ae49"

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
