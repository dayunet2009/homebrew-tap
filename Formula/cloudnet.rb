class Cloudnet < Formula
  desc "A smart cloud network system!"
  homepage "https://cloudnet.world/kb/docs/"
  version "1.36.2.10"
  license "MIT"

  depends_on "curl" => :recommended
  depends_on "grep" => :recommended
  depends_on "bash"
  depends_on "iproute2mac"

  on_macos do
    if Hardware::CPU.intel?
      url "https://pkgs.cloudnet.world/stable/macos/cloudnet_1.36.2.10_amd64.zip"
      sha256 "3f720c4da5fdf877710409f62ae3d80225a6595a9d670cc2494d2d7f5e4927a0"

      def install
        bin.install "cnet"
        bin.install "cloudnet"
        bin.install "cloudnetd"
        # prefix.install "cloudnetd.plist"
        # prefix.install_symlink "cloudnetd.plist" => "#{plist_name}.plist"
      end
    end
    if Hardware::CPU.arm?
      url "https://pkgs.cloudnet.world/stable/macos/cloudnet_1.36.2.10_arm64.zip"
      sha256 "398d78d0ef5d100af6355fdbff13fc904fd3c1e0f1a01292b5b74af9164e666d"

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
