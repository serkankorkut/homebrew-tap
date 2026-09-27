class Tokenmeter < Formula
  include Language::Python::Virtualenv

  desc "Token usage, cost and limits dashboard for Claude Code, Codex and Copilot CLI"
  homepage "https://github.com/serkankorkut/homebrew-tap"
  url "https://github.com/serkankorkut/homebrew-tap/releases/download/v0.2.4/tokenmeter_dashboard-0.2.4.tar.gz"
  sha256 "08178b2b2daaa09027fabc156e624ddb358e878e16b74d7d8f8c59709815e0b3"
  license "MIT"

  depends_on "python@3.13"

  def install
    virtualenv_install_with_resources
  end

  def caveats
    <<~EOS
      Start Tokenmeter and open your dashboard in the browser:
        tokenmeter start

      Your dashboard lives at http://127.0.0.1:7788
      It keeps running in the background and starts again at login.
      Stop it any time with: tokenmeter stop
    EOS
  end

  service do
    run [opt_bin/"tokenmeter"]
    keep_alive true
    log_path var/"log/tokenmeter.log"
    error_log_path var/"log/tokenmeter.log"
  end

  test do
    assert_match "tokenmeter 0.2.4", shell_output("#{bin}/tokenmeter --version")
  end
end
