cask "gary" do
  version "0.3.1"
  sha256 "b24b5cc0df6804d38248114c2b9327b9e0bb54cb1432377cd6c138c1137088fe"

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
