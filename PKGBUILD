pkgname=pwgen
pkgver=0.1.0
pkgrel=1
pkgdesc="Word-based password generator"
arch=('any')
license=('GPL3')
depends=('python' 'python-docopt' 'hunspell-en_US')
makedepends=()
source=('pwgen')
md5sums=('SKIP')

package() {
  mkdir -p "$pkgdir/usr/bin"
  cp pwgen "$pkgdir/usr/bin"
  chmod +x "$pkgdir/usr/bin/pwgen"
}
