class Perllsp < Formula
  desc "Native Rust language server and debug adapter for Perl"
  homepage "https://github.com/EffortlessMetrics/perl-lsp"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/EffortlessMetrics/perl-lsp/releases/download/v0.13.2/perllsp-0.13.2-aarch64-apple-darwin.tar.gz"
      sha256 "b063459beb653593f90d23d72b73021bb8c98d1edfda94c0ab42ec7dfa2198de"
    else
      url "https://github.com/EffortlessMetrics/perl-lsp/releases/download/v0.13.2/perllsp-0.13.2-x86_64-apple-darwin.tar.gz"
      sha256 "d02548bfcf577715d119eaa1c8230f214c38376efe6eb50dcd2d94a1fe3ec3a1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/EffortlessMetrics/perl-lsp/releases/download/v0.13.2/perllsp-0.13.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "31b250dfb62d7417559d0424281505f23d05d051220eab6d0553ddf98e3305cb"
    else
      url "https://github.com/EffortlessMetrics/perl-lsp/releases/download/v0.13.2/perllsp-0.13.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "504c76ef313e2bd97e607210fc7bac38b9aed247c3ea94ead3ef8d6038f3f6bf"
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
