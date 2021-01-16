
EAPI=7

inherit font

DESCRIPTION="single-header ANSI C cross platform GUI library"
HOMEPAGE="https://immediate-mode-ui.github.io/Nuklear/"

COMMIT=74a4df4eb965150ede86fefa6c147476541078a4
SRC_URI="https://github.com/Immediate-Mode-UI/Nuklear/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}"/Nuklear-${COMMIT}
SLOT="$(ver_rs 1)/$(ver_rs 2)"

# C89 and ANSI C library
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~s390 ~sparc ~x86"
LICENSE="MIT Unlicense"
IUSE="+extras"

HTML_DOCS=( "doc/nuklear.html" )

src_install() {
	doheader nuklear.h
	dosym ../nuklear.h /usr/include/nuklear/nuklear.h
	use extras && \
		FONT_SUFFIX="ttf" \
		FONT_S="${S}/extra_font/" font_src_install
	einstalldocs
}
