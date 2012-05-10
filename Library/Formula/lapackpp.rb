require 'formula'

class Lapackpp < Formula
  homepage 'http://lapackpp.sourceforge.net/'
  version '2.5.4'
  url 'http://sourceforge.net/projects/lapackpp/files/lapackpp-2.5.4.tar.gz'
  md5 '9ad74fb73fbcbf378c36a19a5dccbda7'

  def install
    ENV.fortran

    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end

  def test
    system "true"
  end
end
