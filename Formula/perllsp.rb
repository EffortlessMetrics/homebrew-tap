class Perllsp < Formula
  desc "Native Rust language server and debug adapter for Perl"
  homepage "https://github.com/EffortlessMetrics/perl-lsp"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/EffortlessMetrics/perl-lsp/releases/download/v0.13.3/perllsp-0.13.3-aarch64-apple-darwin.tar.gz"
      sha256 "37c8633829d3ce16d082ec527613ba81773b7b91290403cc1547f6f5db983172"
    else
      url "https://github.com/EffortlessMetrics/perl-lsp/releases/download/v0.13.3/perllsp-0.13.3-x86_64-apple-darwin.tar.gz"
      sha256 "bb748d26464cc0424ddc344b68d62c0cceb3500c97b5b34b9bd7ad31f21fcaa2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/EffortlessMetrics/perl-lsp/releases/download/v0.13.3/perllsp-0.13.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1962bb25b13c6da981df60b21ce2504ed59772dc10a43b8872bfe6eaa307432d"
    else
      url "https://github.com/EffortlessMetrics/perl-lsp/releases/download/v0.13.3/perllsp-0.13.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dca8b3654f7a687af0a96fc0ad3517314cadcffae356bf2ba7c912ce65a37740"
    end
  end

  def install
    extracted_dir = Dir.glob("perllsp-#{version}-*").find { |path| File.directory?(path) }
    package_dir = extracted_dir || "."

    bin.install "#{package_dir}/perllsp"
    bin.install "#{package_dir}/perl-dap"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/perllsp --version")
    assert_match version.to_s, shell_output("#{bin}/perl-dap --version")
  end
end
