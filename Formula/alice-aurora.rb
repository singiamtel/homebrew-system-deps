class AliceAurora < Formula
  desc "ALICE O2 System Dependencies via Homebrew"
  homepage "http://alisw.github.io/infrastructure-aurora"
  url "https://github.com/alisw/aurora/archive/0.16.0-alice2.tar.gz"
  sha256 "f1309f8fae38e44d2340bd26d312d92bd2abe54b2e57837015fbbd9aebd9b71a"
  version "0.16.0"

  def install
    # No pants yet for Mojave, so we force High Sierra binaries there
    ENV["PANTS_BINARIES_PATH_BY_ID"] = "{('darwin','15'):('mac','10.11'),('darwin','16'):('mac','10.12'),('darwin','17'):('mac','10.13'),('darwin','18'):('mac','10.13')}"

    system "./pants", "binary", "src/main/python/apache/aurora/kerberos:kaurora"
    system "./pants", "binary", "src/main/python/apache/aurora/kerberos:kaurora_admin"
    bin.install "dist/kaurora.pex" => "aurora"
    bin.install "dist/kaurora_admin.pex" => "aurora_admin"
  end

end
