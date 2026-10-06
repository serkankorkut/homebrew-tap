class Tokenmeter < Formula
  include Language::Python::Virtualenv

  desc "Token usage, cost and limits dashboard for Claude Code, Codex and Copilot CLI"
  homepage "https://github.com/serkankorkut/homebrew-tap"
  url "https://github.com/serkankorkut/homebrew-tap/releases/download/v0.3.4/tokenmeter_dashboard-0.3.4.tar.gz"
  sha256 "6699bdaebad8eab80b41b1a0349bbf4374d657f4ed0b1bd345ab07bf53554735"
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
    assert_match "tokenmeter 0.3.4", shell_output("#{bin}/tokenmeter --version")
  end
end
