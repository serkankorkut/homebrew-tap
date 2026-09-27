class Tokenmeter < Formula
  include Language::Python::Virtualenv

  desc "Token usage, cost and limits dashboard for Claude Code, Codex and Copilot CLI"
  homepage "https://github.com/serkankorkut/homebrew-tap"
  url "https://github.com/serkankorkut/homebrew-tap/releases/download/v0.2.3/tokenmeter_dashboard-0.2.3.tar.gz"
  sha256 "ef2e41c6a5786522468692320df85c577c1163f0411d7441c5459100d49a2f3c"
  license "MIT"

  depends_on "python@3.13"

  def install
    virtualenv_install_with_resources
  end

  service do
    run [opt_bin/"tokenmeter"]
    keep_alive true
    log_path var/"log/tokenmeter.log"
    error_log_path var/"log/tokenmeter.log"
  end

  test do
    assert_match "tokenmeter 0.2.3", shell_output("#{bin}/tokenmeter --version")
  end
end
