class Tokenmeter < Formula
  include Language::Python::Virtualenv

  desc "Token usage, cost and limits dashboard for Claude Code, Codex and Copilot CLI"
  homepage "https://github.com/serkankorkut/homebrew-tap"
  url "https://github.com/serkankorkut/homebrew-tap/releases/download/v0.2.8/tokenmeter_dashboard-0.2.8.tar.gz"
  sha256 "3c798e6e811945938a0aca06376da05f2704db1cce1540abdfaeb681c002b4a7"
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
    assert_match "tokenmeter 0.2.8", shell_output("#{bin}/tokenmeter --version")
  end
end
