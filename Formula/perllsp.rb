class Perllsp < Formula
  desc "Native Rust language server and debug adapter for Perl"
  homepage "https://github.com/EffortlessMetrics/perl-lsp"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/EffortlessMetrics/perl-lsp/releases/download/v0.15.0/perllsp-0.15.0-aarch64-apple-darwin.tar.gz"
      sha256 "b1d073cea3d98648decf572c248e0287ecd4e40de88dcdb171e59332381c3e0d"
    else
      url "https://github.com/EffortlessMetrics/perl-lsp/releases/download/v0.15.0/perllsp-0.15.0-x86_64-apple-darwin.tar.gz"
      sha256 "5c069a503881aaf56aeb629e90188c4476fec4d16b97e043b7313a9f31616737"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/EffortlessMetrics/perl-lsp/releases/download/v0.15.0/perllsp-0.15.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "737e509b7ef4ac790655ff2c2bf73675b8b7ae3c5ac9d62beeaf8d2270baf3dc"
    else
      url "https://github.com/EffortlessMetrics/perl-lsp/releases/download/v0.15.0/perllsp-0.15.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8253bec697bec5005f611e8bd0378373c652cc3908520cdf42645721bd9960cd"
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
