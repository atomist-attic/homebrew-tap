require "language/node"

class AtomistCli < Formula
  desc "The Atomist CLI"
  homepage "https://github.com/atomist/cli#readme"
  url "https://registry.npmjs.org/@atomist/cli/-/@atomist/cli-1.0.0-RC.2.tgz"
  version "1.0.0-RC.2"
  sha256 "5343bbedcc89066c0f47a8c92b8ba8bda24c029c4c8b4423f27f346e8a3bece7"

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
