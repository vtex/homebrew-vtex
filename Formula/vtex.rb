class Vtex < Formula
  desc "CLI tool for creating and managing VTEX apps"
  homepage "https://github.com/vtex/toolbelt"
  url "https://vtex-toolbelt-test.s3.amazonaws.com/vtex-v2.121.3/vtex-v2.121.3-darwin-x64.tar.gz"
  version "2.121.3"
  sha256 "12565d6ad474b11fd0ac55a57da9714bf8445325916d4e85f100a9c970e54e41"
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
  
