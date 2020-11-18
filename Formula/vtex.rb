class Vtex < Formula
  desc "CLI tool for creating and managing VTEX apps"
  homepage "https://github.com/vtex/toolbelt"
  url "https://github.com/vtex/toolbelt/releases/download/v2.119.1/vtex-v2.119.1-darwin-x64.tar.gz"
  sha256 "5ad3636497a9652d20ea9ff033be89b6a439b69a42b04ae86c63aad2185966d6"
  license "MIT"

  def install
    inreplace "bin/vtex", /^CLIENT_HOME=/, "export VTEX_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/vtex"
    system "ln", "-s", libexec, libexec/"node_modules/vtex"
  end

  def caveats; <<~EOS
    VTEX installed!
  EOS
  end

  test do
    system bin/"vtex", "version"
  end
end
  