require "language/node"

class AtomistCli < Formula
  desc "The Atomist CLI"
  homepage "https://github.com/atomist/cli#readme"
  url "https://registry.npmjs.org/@atomist/cli/-/@atomist/cli-1.0.1.tgz"
  version "1.0.1"
  sha256 "ad092db0b802f9c94bcfa64fdb47025e2014cf96491b5f2856f8302b83771168"

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
