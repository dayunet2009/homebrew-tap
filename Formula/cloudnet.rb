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
      sha256 "73c25155bd6c10944b19b8defd57b2845f965c3138939f4f4889bceabcce391b"

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
      sha256 "96f019572e594f67a5bedbf91492249592abb8560af85f82f8e08ab315e3fc93"

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
