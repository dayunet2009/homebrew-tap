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
      sha256 "d9c1c0f8644059065ad2361a770d22801a92b8af9d028db4f274bb1fb437f9c4"

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
      sha256 "c1b04075388e6621bbb32cfd92acf2e7d745f11783bb387884dfcacebae697e7"

      def install
        bin.install "cnet"
        bin.install "cloudnet"
        bin.install "cloudnetd"
      end
    end
  end

  service do
    run opt_bin/"cloudnetd"
    keep_alive true
    log_path var/"log/cloudnetd.log"
    error_log_path var/"log/cloudnetd.log"
  end

  test do
    system "#{bin}/cnet version"
  end
end
