require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php70Phalcon < AbstractPhp70Extension
  init
  desc "Full-stack PHP framework"
  homepage "https://phalconphp.com/"
  url "https://github.com/phalcon/cphalcon/archive/v3.0.0.zip"
  #sha256 "acbffa40a928672d1874345c2aa4eee6f05e087c943e155031db92db3cdc7429"
  sha256 "e5f69dd29f3ae05e267c7cbfd7d6b77ed541736eb3f2f14fe8124de3814d2f55"
  head "https://github.com/phalcon/cphalcon.git"

  depends_on "pcre"

  bottle do
    cellar :any_skip_relocation
    sha256 "f991c2fc97e02ab73145d6eea7cd705bc944bde386613aee2d71ab0ad3c8501c" => :high_sierra
  end

  def install
    Dir.chdir "build/php7/64bits"

    safe_phpize
    system "./configure", "--prefix=#{prefix}",
                          phpconfig,
                          "--enable-phalcon"
    system "make"
    prefix.install "modules/phalcon.so"
    write_config_file if build.with? "config-file"
  end
end
