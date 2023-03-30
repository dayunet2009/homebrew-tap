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
      sha256 "6057fefc29939e77fe062381f9c51826e1a2173cf1f8a05512b15a0dda412406"

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
      sha256 "c747608f5b43eee9a4bf201c0368f576ab278f90ebebcd735d61f32dd755fcf9"

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
