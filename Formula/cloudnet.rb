class Cloudnet < Formula
  desc "A smart cloud network system!"
  homepage "https://cloudnet.world/kb/docs/"
  version "1.36.2.12"
  license "MIT"

  depends_on "curl" => :recommended
  depends_on "grep" => :recommended
  depends_on "bash"
  depends_on "iproute2mac"

  on_macos do
    if Hardware::CPU.intel?
      url "https://pkgs.cloudnet.world/stable/macos/cloudnet_1.36.2.12_amd64.zip"
      sha256 "4c772f2722fc9bc6022a44534d9f555520eb2a1f7b7252ec255f2f424ff813d7"

      def install
        bin.install "cnet"
        bin.install "cloudnet"
        bin.install "cloudnetd"
        # prefix.install "cloudnetd.plist"
        # prefix.install_symlink "cloudnetd.plist" => "#{plist_name}.plist"
      end
    end
    if Hardware::CPU.arm?
      url "https://pkgs.cloudnet.world/stable/macos/cloudnet_1.36.2.12_arm64.zip"
      sha256 "71b2d2162e553ea993f88837e07b916fa845e1a01e1c9a7de51ced7ed6aafcf3"

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
