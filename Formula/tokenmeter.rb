class Tokenmeter < Formula
  include Language::Python::Virtualenv

  desc "Token usage, cost and limits dashboard for Claude Code, Codex and Copilot CLI"
  homepage "https://github.com/serkankorkut/tokenmeter"
  url "https://files.pythonhosted.org/packages/87/0b/2791d0c413a9e6a8f61d7e822da20bd775e1db63dc7c948213fb0fc30533/tokenmeter_dashboard-0.2.0.tar.gz"
  sha256 "7de4aa98e1217c509fa80e3af796497ed85b71b58a06ebc9822d9fa338dcf046"
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
    assert_match "tokenmeter 0.2.0", shell_output("#{bin}/tokenmeter --version")
  end
end
