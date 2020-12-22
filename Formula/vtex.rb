class Vtex < Formula
  desc "CLI tool for creating and managing VTEX apps"
  homepage "https://github.com/vtex/toolbelt"
<<<<<<< HEAD
  url "https://vtex-toolbelt-test.s3.amazonaws.com/vtex-v2.121.0/vtex-v2.121.0-darwin-x64.tar.gz"
  version "2.121.0"
  sha256 "fe977ac320cafab6bfa748206506d69e09b47e0451845c5522336adaf3ab23bb"
=======
  url "https://vtex-toolbelt-test.s3.amazonaws.com/vtex-v2.119.2/vtex-v2.119.2-darwin-x64.tar.gz"
  version "2.119.2"
  sha256 "e8d41f7d45f757e8ae2dea4fef909bbc38bd9e405a68ea86ae47da89f3aa4df2"
>>>>>>> Automatic brew bump version
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
  
