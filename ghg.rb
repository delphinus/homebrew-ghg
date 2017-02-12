class Ghg < Formula
  desc "Get the executable from github releases"
  homepage "https://github.com/Songmu/ghg"
  url "https://github.com/Songmu/ghg/archive/v0.0.3.tar.gz"
  sha256 "19606c6d24d4fb2621fc6cae8f9c8f336b7de318ace984a8da37beff732c91d5"
  head "https://github.com/Songmu/ghg.git"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    (buildpath/"src/github.com/Songmu/ghg").install buildpath.children
    cd "src/github.com/Songmu/ghg" do
      system "go", "build", "-o", bin/"ghg", "cmd/ghg/main.go"
      prefix.install_metafiles
    end
  end

  test do
    system "#{bin}/ghg", "--version"
  end
end
