require 'formula'

class Gqview < Formula
  homepage 'http://gqview.sourceforge.net'
  url 'http://downloads.sourceforge.net/project/gqview/gqview/2.0.4/gqview-2.0.4.tar.gz'
  md5 '7196deab04db94cec2167637cddc02f9'

  depends_on 'gtk+'

  def patches
    { :p0 => DATA }
  end

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--mandir=#{man}"
    system "make install"
  end
end

__END__
diff -u src/layout_image.c.orig src/layout_image.c
--- src/layout_image.c.orig	2006-10-23 11:39:12.000000000 +0200
+++ src/layout_image.c	2012-04-23 16:40:02.000000000 +0200
@@ -275,6 +275,7 @@
 			case GDK_Page_Down: case GDK_KP_Page_Down:
 			case GDK_space:
 			case 'N': case 'n':
+			case GDK_Down:
 				layout_image_next(lw);
 				break;
 			case GDK_Home: case GDK_KP_Home:
diff -u src/layout_util.c.orig src/layout_util.c
--- src/layout_util.c.orig	2006-11-03 00:25:27.000000000 +0100
+++ src/layout_util.c	2012-04-23 16:40:02.000000000 +0200
@@ -116,10 +116,12 @@
 				x += 1;
 				break;
 			case GDK_Up: case GDK_KP_Up:
-				y -= 1;
+				layout_image_prev(lw);
+				//y -= 1;
 				break;
 			case GDK_Down: case GDK_KP_Down:
-				y += 1;
+				layout_image_next(lw);
+				//y += 1;
 				break;
 			default:
 				stop_signal = FALSE;
diff -u src/view_file_icon.c.orig src/view_file_icon.c
--- src/view_file_icon.c.orig	2006-11-30 23:55:00.000000000 +0100
+++ src/view_file_icon.c	2012-04-23 16:40:03.000000000 +0200
@@ -1187,6 +1187,7 @@
 			focus_row = -1;
 			stop_signal = TRUE;
 			break;
+		case GDK_space:
 		case GDK_Down: case GDK_KP_Down:
 			focus_row = 1;
 			stop_signal = TRUE;
@@ -1209,6 +1210,7 @@
 			focus_col = vfi->columns - 1 - vfi->focus_column;
 			stop_signal = TRUE;
 			break;
+			/*
 		case GDK_space:
 			fd = vficon_find_data(vfi, vfi->focus_row, vfi->focus_column, NULL);
 			if (fd)
@@ -1238,6 +1240,7 @@
 				}
 			stop_signal = TRUE;
 			break;
+			*/
 		case GDK_Menu:
 			fd = vficon_find_data(vfi, vfi->focus_row, vfi->focus_column, NULL);
 			vfi->click_fd = fd;
