require "language/node"

class Cdk8s < Formula
  desc "Define k8s native apps and abstractions using object-oriented programming"
  homepage "https://cdk8s.io/"
  url "https://registry.npmjs.org/cdk8s-cli/-/cdk8s-cli-1.0.96.tgz"
  sha256 "a86852dc0d7040cdf0baf37cf90ad623bdb84d8485c00c1216dc64ee8888d338"
  license "Apache-2.0"

  bottle do
    sha256 cellar: :any_skip_relocation, all: "8249878facfee332b62c6af4fc9ef9c680beed2415a57a6423dfa97506a06925"
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "Cannot initialize a project in a non-empty directory",
      shell_output("#{bin}/cdk8s init python-app 2>&1", 1)
  end
end
