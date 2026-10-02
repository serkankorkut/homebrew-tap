class Tokenmeter < Formula
  include Language::Python::Virtualenv

  desc "Token usage, cost and limits dashboard for Claude Code, Codex and Copilot CLI"
  homepage "https://github.com/serkankorkut/homebrew-tap"
  url "https://github.com/serkankorkut/homebrew-tap/releases/download/v0.2.9/tokenmeter_dashboard-0.2.9.tar.gz"
  sha256 "1f4c1c8c2caf68812d8ff90c1f6828a84eb1b642c662407e68da7b95b35dcc9c"
  license "MIT"

  depends_on "python@3.13"

  def install
    virtualenv_install_with_resources
  end

  def caveats
    <<~EOS
      Start Tokenmeter and open your dashboard in the browser:
        tokenmeter start

      It keeps running in the background and starts again at login.
      After an upgrade, run tokenmeter start again. Stop it with: tokenmeter stop

      Your dashboard: http://127.0.0.1:7788
    EOS
  end

  test do
    assert_match "tokenmeter 0.2.9", shell_output("#{bin}/tokenmeter --version")
  end
end
