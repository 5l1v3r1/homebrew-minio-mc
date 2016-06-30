require "language/go"

# we're using an ugly workaround here, because the tar is being extracted in builddir,
# and we need to build into the $GOPATH/src/github.com/minio/mc/. Softlinking isn't working
# with every shell. So we're using the go_resource to go get the correct revision, while
# actually not using the tar from the url. The url isn't possible to skip.

class Miniomc < Formula
  homepage "https://github.com/minio/mc"
  url "https://github.com/minio/mc/archive/RELEASE.2016-06-03T18-48-37Z.tar.gz"
  version "1.0"
  head "https://github.com/minio/mc.git"
  sha256 "ac27ce934d5d71a1150eed69641a7ba801f3ae90c064ee944c154e311a5e6dbc"

  depends_on "go" => :build

  go_resource "github.com/minio/mc" do
      url "https://github.com/minio/mc.git",
          :revision => "475670de7d9b10f4bc0d5d6f25f1a858c32c5628"
  end

  def install
      ENV["GOPATH"] = buildpath

      Language::Go.stage_deps resources, buildpath/"src"

      cd buildpath/"src/github.com/minio/mc" do
          system "go", "build", "-o", buildpath/"minio-mc" 
      end

      bin.install buildpath/"minio-mc"
  end

  test do
    system "#{bin}/minio-mc"
  end
end
