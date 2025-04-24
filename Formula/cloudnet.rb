class Cloudnet < Formula
  desc "A smart cloud network system!"
  homepage "https://cloudnet.world/kb/docs/"
  version "1.36.2.13"
  license "MIT"

  depends_on "curl" => :recommended
  depends_on "grep" => :recommended
  depends_on "bash"
  depends_on "iproute2mac"

  on_macos do
    if Hardware::CPU.intel?
      url "https://pkgs.cloudnet.world/stable/macos/cloudnet_1.36.2.13_amd64.zip"
      sha256 "c5956aa95530d25ebf64d76a85865295eb6ce26c2212fbcb322b658ba4e457d5"

      def install
        bin.install "cnet"
        bin.install "cloudnet"
        bin.install "cloudnetd"
        # prefix.install "cloudnetd.plist"
        # prefix.install_symlink "cloudnetd.plist" => "#{plist_name}.plist"
      end
    end
    if Hardware::CPU.arm?
      url "https://pkgs.cloudnet.world/stable/macos/cloudnet_1.36.2.13_arm64.zip"
      sha256 "36ac37b3513a6d993bb317a29fe6d53b6f2ca9dc2eb5c20894623900881f7939"

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
