class Godns < Formula
  desc "GoDNS is a self-hosted dynamic DNS (DDNS) client with multi-provider support and a built-in web panel."
  homepage "https://github.com/TimothyYe/godns"
  license "Apache-2.0"
  version "3.4.1"
  head "https://github.com/TimothyYe/godns.git", branch: "master"

  on_macos do
    on_arm do
      url "https://github.com/TimothyYe/godns/releases/download/v#{version}/godns_#{version}_darwin_arm64.tar.gz"
      sha256 "d0413d48778b6321744df09203f7050801bf610425d520ed77b159cde6b2967b"
    end

    on_intel do
      url "https://github.com/TimothyYe/godns/releases/download/v#{version}/godns_#{version}_darwin_amd64.tar.gz"
      sha256 "8f77f08f0f7366ed29e405b5d13d43c8a85ae2560a33efc3f7f4e113391a8641"
    end
  end

  def install
    bin.install "godns"
  end

  service do
    run [opt_bin/"godns", "-c", etc/"godns.yaml"]
    keep_alive true
    error_log_path var/"log/godns.log"
    log_path var/"log/godns.log"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/godns -h")
  end
end