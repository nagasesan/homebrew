require 'formula'

class Vim <Formula
  url      'ftp://ftp.jp.vim.org/pub/vim/unix/vim-7.3.tar.bz2'
  homepage ''
  md5      '5b9510a17074e2b37d8bb38ae09edbf2'
  head     'http://vim.svn.sourceforge.net/svnroot/vim/trunk/'
  version  '7.3.107'


  depends_on 'ncursesw'
  depends_on 'ctags'
  depends_on 'libiconv'

  def patches
    patch_level = version.split('.').last.to_i
    {'p0' => (1..patch_level).map{|i| "ftp://ftp.jp.vim.org/pub/vim/patches/7.3/7.3.%03d" % i } }
  end

  def install
    args = [ "--prefix=#{prefix}",
             "--disable-gui",
             "--without-x",
             "--disable-nls",
             "--disable-gpm",
             "--enable-multibyte",
             "--with-tlib=ncurses",
             "--enable-perlinterp",
             # "--enable-rubyinterp",
             "--enable-pythoninterp",
             "--with-features=huge" ]

    system "./configure", *args

    system "make install"
    symlink bin+"vim", bin+"vi"
  end
end
