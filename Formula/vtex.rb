class Vtex < Formula
  desc "CLI tool for creating and managing VTEX apps"
  homepage "https://github.com/vtex/toolbelt"
  url "https://github.com/vtex/toolbelt/releases/download/v2.119.2/vtex-v2.119.2-darwin-x64.tar.gz"
  sha256 "e8d41f7d45f757e8ae2dea4fef909bbc38bd9e405a68ea86ae47da89f3aa4df2"
  license "MIT"
  version "2.119.2"

  def install
    inreplace "bin/vtex", /^CLIENT_HOME=/, "export VTEX_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/vtex"
    system "ln", "-s", libexec, libexec/"node_modules/vtex"
  end

  def caveats; <<~EOS
    Success: VTEX CLI release installed. Run vtex help to see the commands.
  EOS
  end

  test do
    system bin/"vtex", "version"
  end
end
  