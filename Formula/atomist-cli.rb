require "language/node"

class AtomistCli < Formula
  desc "The Atomist CLI"
  homepage "https://github.com/atomist/cli#readme"
  url "https://registry.npmjs.org/@atomist/cli/-/cli-1.0.0-M.5a.tgz"
  version "1.0.0-M.5a"
  sha256 "65fc97486682352d155e4a8180b320c002f07cfcfcfb71274523d37f19643fb7"

  devel do
    url "https://registry.npmjs.org/@atomist/cli/-/cli-1.0.0-M.5a.tgz"
    version "1.0.0-M.5a"
    sha256 "65fc97486682352d155e4a8180b320c002f07cfcfcfb71274523d37f19643fb7"
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    raise "Test not implemented."
  end
end
