require 'formula'

class Liblemon < Formula
  homepage 'http://lemon.cs.elte.hu/trac/lemon'
  url 'http://lemon.cs.elte.hu/pub/sources/lemon-1.2.3.tar.gz'
  md5 '750251a77be450ddddedab14e5163afb'

  depends_on 'cmake' => :build

  def install
    system "cmake . #{std_cmake_parameters}"
    system "make install"
  end
end
