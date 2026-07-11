class Shiplog < Formula
  desc "Local-first, receipt-backed work evidence and review packets"
  homepage "https://github.com/EffortlessMetrics/shiplog"
  version "0.10.0"
  license any_of: ["MIT", "Apache-2.0"]

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/EffortlessMetrics/shiplog/releases/download/v0.10.0/shiplog-x86_64-apple-darwin"
      sha256 "cbc4be5e925f255e337db9f03320b7025c082a7befc9644af48c5f30d4e8222b"
    else
      url "https://github.com/EffortlessMetrics/shiplog/releases/download/v0.10.0/shiplog-aarch64-apple-darwin"
      sha256 "8fd64718d566641b1d638034c93227d5864ce7049e064655c1d81497355efd52"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/EffortlessMetrics/shiplog/releases/download/v0.10.0/shiplog-x86_64-unknown-linux-gnu"
      sha256 "e9b4304f0db625782ef735f6733878103973d36672ccbab1464e575bb9b05e2a"
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
