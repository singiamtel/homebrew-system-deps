class AliceAurora < Formula
  desc "ALICE O2 System Dependencies via Homebrew"
  homepage "http://alisw.github.io/infrastructure-aurora"
  url "https://github.com/alisw/aurora/archive/0.16.0-alice3.tar.gz"
  sha256 "256c2b5fc0e3885599624f39793731f93162021c21c1487c8a29ef59b4005b18"
  version "0.16.0-alice3"

  def install
    # No pants yet for Mojave, so we force High Sierra binaries there
    ENV["PANTS_BINARIES_PATH_BY_ID"] = "{('darwin','15'):('mac','10.11'),('darwin','16'):('mac','10.12'),('darwin','17'):('mac','10.13'),('darwin','18'):('mac','10.13')}"

    system "./pants", "binary", "src/main/python/apache/aurora/kerberos:kaurora"
    system "./pants", "binary", "src/main/python/apache/aurora/kerberos:kaurora_admin"
    bin.install "dist/kaurora.pex" => "aurora"
    bin.install "dist/kaurora_admin.pex" => "aurora_admin"
  end

end
