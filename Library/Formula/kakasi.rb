class Kakasi < Formula
  homepage "http://kakasi.namazu.org/"
  url "http://kakasi.namazu.org/stable/kakasi-2.3.6.tar.gz"
  sha1 "5f2e02264dda11940fb7b5387c327d4c4324bdb3"

  bottle do
    revision 1
    sha1 "3dc9fd7f8400f0f9881a85afd1031c6e4a3eec85" => :yosemite
    sha1 "ebd2317184992b420fb44c2d5a287eb29a7c9cec" => :mavericks
    sha1 "3fa224c221fd544782b8955f2988d918dea5caca" => :mountain_lion
  end

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    hiragana = "\xa4\xa2 \xa4\xab \xa4\xb5"
    romanji = pipe_output("kakasi -rh -ieuc -Ha", hiragana).chomp
    assert_equal "a ka sa", romanji
  end
end
