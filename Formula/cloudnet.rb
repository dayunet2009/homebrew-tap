class Cloudnet < Formula
  desc "A smart cloud network system!"
  homepage "https://cloudnet.world"
  version "1.36.2"
  license "MIT"

  depends_on "curl" => :recommended
  depends_on "grep" => :recommended
  depends_on "bash"
  depends_on "iproute2mac"

  on_macos do
    if Hardware::CPU.intel?
      url "https://pkgs.dayunet.com/stable/macos/cloudnet_1.36.2_amd64.zip"
      sha256 "90d9c0332e319cdc3f03c348077de68ebccf83a477e2e996fcd93b0ba358b901"

      def install
        bin.install "cnet"
        bin.install "cloudnet"
        bin.install "cloudnetd"
        # prefix.install "cloudnetd.plist"
        # prefix.install_symlink "cloudnetd.plist" => "#{plist_name}.plist"
      end
    end
    if Hardware::CPU.arm?
      url "https://pkgs.dayunet.com/stable/macos/cloudnet_1.36.2_arm64.zip"
      sha256 "2c5e9576d3d6601d20ceadddb6595911888be660650e96075362fb3e3e8a93b8"

      def install
        bin.install "cnet"
        bin.install "cloudnet"
        bin.install "cloudnetd"
      end
    end
  end

  service do
    run [opt_bin / "cloudnetd"]
    keep_alive true
    log_path var / "log/cloudnetd.log"
    error_log_path var / "log/cloudnetd.log"
  end

  test do
    system "#{bin}/cnet version"
  end
end
