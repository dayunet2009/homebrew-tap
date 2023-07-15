class Cloudnet < Formula
  desc "A smart cloud network system!"
  homepage "https://cloudnet.world/kb/"
  version "1.36.2"
  license "MIT"

  depends_on "curl" => :recommended
  depends_on "grep" => :recommended
  depends_on "bash"
  depends_on "iproute2mac"

  on_macos do
    if Hardware::CPU.intel?
      url "https://pkgs.cloudnet.world/stable/macos/cloudnet_1.36.2_amd64.zip"
      sha256 "29c7a29abddc3391b5bde3321c838db73868ba6a53abf62727a6fe3ee339e34b"

      def install
        bin.install "cnet"
        bin.install "cloudnet"
        bin.install "cloudnetd"
        # prefix.install "cloudnetd.plist"
        # prefix.install_symlink "cloudnetd.plist" => "#{plist_name}.plist"
      end
    end
    if Hardware::CPU.arm?
      url "https://pkgs.cloudnet.world/stable/macos/cloudnet_1.36.2_arm64.zip"
      sha256 "eec501779a659264fbc100bd4011afb9d08992fcaf7a4f36620919141d21d2ab"

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
