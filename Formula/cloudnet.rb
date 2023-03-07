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
      sha256 "d65d24e77cc8745f572f31f2a31071373abac22850a718ccfcb3964d0a587355"

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
      sha256 "af42d2e7334d4cadedc5eff3855c3e7b05bf95de94ec8f3e8cd5d63f738832c5"

      def install
        bin.install "cnet"
        bin.install "cloudnet"
        bin.install "cloudnetd"
      end
    end
  end

  service do
    run [opt_bin/"cloudnetd"]
    keep_alive true
    log_path var/"log/cloudnetd.log"
    error_log_path var/"log/cloudnetd.log"
  end

  test do
    system "#{bin}/cnet version"
  end
end
