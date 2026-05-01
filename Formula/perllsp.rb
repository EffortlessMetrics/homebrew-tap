class Perllsp < Formula
  desc "Native Rust language server and debug adapter for Perl"
  homepage "https://github.com/EffortlessMetrics/perl-lsp"
  version "0.13.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/EffortlessMetrics/perl-lsp/releases/download/v#{version}/perllsp-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "cd7e7cb2f89baf18a4ec5c4cfea8b4261ac257e8cd865dc28ee66ce29c5566bc"
    else
      url "https://github.com/EffortlessMetrics/perl-lsp/releases/download/v#{version}/perllsp-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "d9440414252c1a73e651c16ee92294fb572c9819d5a9ca5e0659fff88a957fe3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/EffortlessMetrics/perl-lsp/releases/download/v#{version}/perllsp-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2e4306723716a56f384863afe9a497c7c2e9d4e282f3244a9e7a3978f715e5ca"
    else
      url "https://github.com/EffortlessMetrics/perl-lsp/releases/download/v#{version}/perllsp-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "06272968a4be4294a106473e7a78c6c664eb3275e6ca907674b539ff820ec537"
    end
  end

  def install
    extracted_dir = Dir.glob("perllsp-#{version}-*").find { |path| File.directory?(path) }
    raise "expected release archive directory perllsp-#{version}-<target>" unless extracted_dir

    bin.install "#{extracted_dir}/perllsp"
    bin.install "#{extracted_dir}/perl-dap"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/perllsp --version")
    assert_match version.to_s, shell_output("#{bin}/perl-dap --version")
  end
end
