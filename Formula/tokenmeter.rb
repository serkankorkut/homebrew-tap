class Tokenmeter < Formula
  include Language::Python::Virtualenv

  desc "Token usage, cost and limits dashboard for Claude Code, Codex and Copilot CLI"
  homepage "https://github.com/serkankorkut/tokenmeter"
  url "https://github.com/serkankorkut/homebrew-tap/releases/download/v0.2.2/tokenmeter_dashboard-0.2.2.tar.gz"
  sha256 "63027ba56820f1dd2b0bd5d755f3fd60c89abea6aeb7b6ec163b911de3bd33a4"
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
    assert_match "tokenmeter 0.2.2", shell_output("#{bin}/tokenmeter --version")
  end
end
