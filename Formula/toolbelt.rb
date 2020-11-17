class Toolbelt < Formula
  desc "CLI tool for creating and managing VTEX apps"
  homepage "https://github.com/vtex/toolbelt"
  url "https://github.com/vtex/toolbelt/releases/download/v2.119.1/toolbelt-v2.119.1-darwin-x64.tar.gz"
  sha256 "85b799e19426f5891a1a2cca620660c4107df4e4bad33d781b0ff63eb5ab0d0d"
  license "MIT"

  def install
    inreplace "bin/toolbelt", /^CLIENT_HOME=/, "export toolbelt_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/toolbelt"
    system "ln", "-s", libexec, libexec/"node_modules/vtex"
  end

  def caveats; <<~EOS
    VTEX installed!
  EOS
  end

  test do
    system bin/"toolbelt", "version"
  end
end
  