class Ghg < Formula
  desc "Get the executable from github releases"
  homepage "https://github.com/Songmu/ghg"
  url "https://github.com/Songmu/ghg/archive/v0.1.4.tar.gz"
  sha256 "1839f9f945a07f682c7db33896c32a30a8d0e303167795a0b16a4783c6194ff2"
  head "https://github.com/Songmu/ghg.git"

  depends_on "go" => :build
  depends_on "dep" => :build

  def install
    ENV["GOPATH"] = buildpath
    (buildpath/"src/github.com/Songmu/ghg").install buildpath.children
    cd "src/github.com/Songmu/ghg" do
      system "dep", "ensure"
      system "go", "build", "-o", bin/"ghg", "cmd/ghg/main.go"
      prefix.install_metafiles
    end
  end

  test do
    system "#{bin}/ghg", "--version"
  end
end
