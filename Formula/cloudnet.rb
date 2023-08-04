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
      sha256 "62c19cf643312b87b0b27af11adcb6a693dd4ed5af76b5372382df9aeb821fed"

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
      sha256 "67a6dd992a4dfe214510c9fc192bec271b9a58e1390bab9cc3091c76da4909f3"

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
