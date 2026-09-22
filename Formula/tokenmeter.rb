class Tokenmeter < Formula
  include Language::Python::Virtualenv

  desc "Token usage, cost and limits dashboard for Claude Code, Codex and Copilot CLI"
  homepage "https://github.com/serkankorkut/tokenmeter"
  url "https://files.pythonhosted.org/packages/38/f4/5f1a07f194926c9d68c5fabf3a0631285a98dd8272a173eeaa96079ed5be/tokenmeter_dashboard-0.2.1.tar.gz"
  sha256 "e8c9a9f2c10b92d07af79294b608d63cba491eb277eeb1464b292cbc23649fdd"
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
    assert_match "tokenmeter 0.2.1", shell_output("#{bin}/tokenmeter --version")
  end
end
