class Cloudnet < Formula
  desc "A smart cloud network system!"
  homepage "https://cnet.dayunet.com"
  version "1.22.3"
  license "MIT"

  depends_on "curl" => :recommended
  depends_on "grep" => :recommended
  depends_on "bash"
  depends_on "iproute2mac"

  on_macos do
    if Hardware::CPU.intel?
      url "https://cnet.dayunet.com/pkgs/stable/macos/cloudnet_1.22.3_amd64.zip"
      sha256 "fd193eb95ea6e97b44ed25fdfc0e23562ac50bc6f23a63aa5f45315acfe4aeb4"

      def install
        bin.install "cnet"
        bin.install "cloudnet"
        bin.install "cloudnetd"
        # prefix.install "cloudnetd.plist"
        # prefix.install_symlink "cloudnetd.plist" => "#{plist_name}.plist"
      end
    end
    if Hardware::CPU.arm?
      url "https://cnet.dayunet.com/pkgs/stable/macos/cloudnet_1.22.3_arm64.zip"
      sha256 "f6f18b362d12ad017b74cb2031316047bbcf017fc9272c856c8db5f2edf96a76"

      def install
        bin.install "cnet"
        bin.install "cloudnet"
        bin.install "cloudnetd"
      end
    end
  end

  service do
    run [opt_bin/"cloudnetd", "-socks5-server", "0.0.0.0:7889"]
    keep_alive true
    log_path var/"log/cloudnetd.log"
    error_log_path var/"log/cloudnetd.log"
  end

  test do
    system "#{bin}/cnet version"
  end
end
