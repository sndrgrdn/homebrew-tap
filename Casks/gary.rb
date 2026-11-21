cask "gary" do
  version "0.2.0"
  sha256 "98d022b0e4bc0297669b5943364d3ce9c755e682992414b836832f4812ed5d48"

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
