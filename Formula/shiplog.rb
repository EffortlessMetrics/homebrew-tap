class Shiplog < Formula
  desc "Local-first, receipt-backed work evidence and review packets"
  homepage "https://github.com/EffortlessMetrics/shiplog"
  version "0.11.0"
  license any_of: ["MIT", "Apache-2.0"]

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/EffortlessMetrics/shiplog/releases/download/v0.11.0/shiplog-x86_64-apple-darwin"
      sha256 "864b03532f79f7a88cfd2b396336a64317bf397354845ecb012f573afef4ad3b"
    else
      url "https://github.com/EffortlessMetrics/shiplog/releases/download/v0.11.0/shiplog-aarch64-apple-darwin"
      sha256 "3db09f243c677809f808076a2be60b1fb50cacbd5f3faebc00a7155d6277af06"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/EffortlessMetrics/shiplog/releases/download/v0.11.0/shiplog-x86_64-unknown-linux-gnu"
      sha256 "0a4cebcaa5cc52a6ed9ad7457bc704ce3121c9e921719d7618eb8e69c9ba8625"
    else
      odie "shiplog's Homebrew formula currently supports Intel Linux only"
    end
  end

  def install
    binary = Dir["shiplog-*"]
    bin.install binary.first => "shiplog"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/shiplog --version")
  end
end
