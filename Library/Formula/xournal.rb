require 'formula'

class Xournal < Formula
  homepage 'http://xournal.sourceforge.net/'
  url 'http://downloads.sourceforge.net/xournal/xournal-0.4.5.tar.gz'
  md5 '795e4396ded2b67766eb2926be1fb4a9'

  depends_on 'gtk'
  depends_on 'libgnomecanvas'
  depends_on 'poppler'

  def install
    ENV.x11 # if your formula requires any X11 headers

    #system "./autogen.sh"
    system "./configure", "--prefix=#{prefix}"
    system "make install"
    system "make desktop-install"
  end

  def test
    system "true"
  end
end
