class Cloudnet < Formula
  desc "A smart cloud network system!"
  homepage "https://cloudnet.world/kb/docs/"
  version "1.36.2.11"
  license "MIT"

  depends_on "curl" => :recommended
  depends_on "grep" => :recommended
  depends_on "bash"
  depends_on "iproute2mac"

  on_macos do
    if Hardware::CPU.intel?
      url "https://pkgs.cloudnet.world/stable/macos/cloudnet_1.36.2.11_amd64.zip"
      sha256 "f7bc5530fc1cfb59e45ef8b9727a5fd4fbc0d4805b711ee8c73a42eaab590e7d"

      def install
        bin.install "cnet"
        bin.install "cloudnet"
        bin.install "cloudnetd"
        # prefix.install "cloudnetd.plist"
        # prefix.install_symlink "cloudnetd.plist" => "#{plist_name}.plist"
      end
    end
    if Hardware::CPU.arm?
      url "https://pkgs.cloudnet.world/stable/macos/cloudnet_1.36.2.11_arm64.zip"
      sha256 "02aec42321610966a6f746bef4493a155477dc5d4c4c967146cb2a7421d778e4"

      def install
        bin.install "cnet"
        bin.install "cloudnet"
        bin.install "cloudnetd"
      end
    end
  end

  # service do
  #   run [opt_bin / "cloudnetd"]
  #   keep_alive true
  #   log_path var / "log/cloudnetd.log"
  #   error_log_path var / "log/cloudnetd.log"
  # end

  test do
    system "#{bin}/cnet version"
  end
end
