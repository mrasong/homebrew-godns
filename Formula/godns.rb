class Godns < Formula
  desc "GoDNS is a self-hosted dynamic DNS (DDNS) client with multi-provider support and a built-in web panel."
  homepage "https://github.com/TimothyYe/godns"
  license "Apache-2.0"
  version "3.4.2"
  head "https://github.com/TimothyYe/godns.git", branch: "master"

  on_macos do
    on_arm do
      url "https://github.com/TimothyYe/godns/releases/download/v#{version}/godns_#{version}_darwin_arm64.tar.gz"
      sha256 "e625259c62acd65aac2117284f44b5044fab7e5ffaa4c4bf8d351df732e510b7"
    end

    on_intel do
      url "https://github.com/TimothyYe/godns/releases/download/v#{version}/godns_#{version}_darwin_amd64.tar.gz"
      sha256 "d5fc0458a1507ff1ca8053fb5669aa5a40a000e2d3eda8747372f672f76970f3"
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