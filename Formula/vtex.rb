class Vtex < Formula
  desc "CLI tool for creating and managing VTEX apps"
  homepage "https://github.com/vtex/toolbelt"
  url "https://vtex-toolbelt-test.s3.amazonaws.com/vtex-v2.121.1/vtex-v2.121.1-darwin-x64.tar.gz"
  version "2.121.1"
  sha256 "4e24de68f947ce14379110c36ea8e3c1aa32c0c3bcceab09b533c15a58f04fd8"
  version "2.119.4"

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
  
