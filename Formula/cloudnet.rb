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
      sha256 "eb116d5cd47ae094c3c7a61756c6dedb4f67e2ad6493cb31abf20bb92375c259"

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
      sha256 "7d2190962e1cc3828996ebef5830670c7b4815806998f13bb9195d236733634a"

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
