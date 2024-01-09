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
      sha256 "ba19bb59fe0dd6fa618b1cc2a832d37913c768a93b3684f4795121fc221f89c1"

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
      sha256 "dccf83d689122fb91bf830462427954f7fbb378e4f114d236699a07c718dab63"

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
