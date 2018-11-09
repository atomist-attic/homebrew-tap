require "language/node"

class AtomistCli < Formula
  desc "The Atomist CLI"
  homepage "https://github.com/atomist/cli#readme"
  url "https://registry.npmjs.org/@atomist/cli/-/@atomist/cli-1.0.2.tgz"
  version "1.0.2"
  sha256 "d80ac79fd9e480bed6fcde980ed53e6c2bd24b7d4ecea57c7cb346d08a308f34"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
    bash_completion.install "#{libexec}/lib/node_modules/@atomist/cli/assets/bash_completion/atomist"
  end

  test do
    assert File.exist? "#{bin}/atomist"
    assert File.exist? "#{bin}/@atomist"
  end
end
