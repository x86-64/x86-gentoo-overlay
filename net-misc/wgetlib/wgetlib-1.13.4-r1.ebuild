# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-misc/wget/wget-1.13.4-r1.ebuild,v 1.4 2012/01/13 06:19:16 vapier Exp $

EAPI=5

inherit flag-o-matic toolchain-funcs autotools

DESCRIPTION="Network utility to retrieve files from the WWW"
HOMEPAGE="http://www.gnu.org/software/wget/"
SRC_URI="mirror://gnu/wget/wget-${PV}.tar.xz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~alpha amd64 ~arm ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~ppc-aix ~sparc-fbsd ~x86-fbsd ~x64-freebsd ~x86-freebsd ~hppa-hpux ~ia64-hpux ~x86-interix ~amd64-linux ~ia64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~m68k-mint ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"
IUSE="debug idn ipv6 nls ntlm static"

LIB_DEPEND="idn? ( net-dns/libidn[static-libs(+)] )"
RDEPEND="!static? ( ${LIB_DEPEND//\[static-libs(+)]} )"
DEPEND="${RDEPEND}
	app-arch/xz-utils
	dev-util/pkgconfig
	static? ( ${LIB_DEPEND} )
	nls? ( sys-devel/gettext )"

REQUIRED_USE=""

src_unpack() {
	unpack ${A}
	mv "${WORKDIR}/wget-${PV}/" "${S}"
	cp "${FILESDIR}/wgetlib.h" "${S}/src/"
}

src_prepare() {
	epatch "${FILESDIR}"/wget-${PV}-openssl-pkg-config.patch
	epatch "${FILESDIR}"/wget-${PV}-as_lib.patch
	epatch "${FILESDIR}"/wget-${PV}-urls_memory.patch
	epatch "${FILESDIR}"/wget-${PV}-css_bugfix.patch
	epatch "${FILESDIR}"/wget-${PV}-nodoc.patch
	eautoreconf
}

src_configure() {
	# openssl-0.9.8 now builds with -pthread on the BSD's
	use elibc_FreeBSD && use ssl && append-ldflags -pthread
	# fix compilation on Solaris, we need filio.h for FIONBIO as used in
	# the included gnutls -- force ioctl.h to include this header
	[[ ${CHOST} == *-solaris* ]] && append-flags -DBSD_COMP=1

	# the configure script contains a few hacks to workaround openssl
	# build limitations.  disable those, and use openssl's pkg-config.
	eval export ac_cv_lib_{z_compress,dl_{dlopen,shl_load}}=no

	if use static ; then
		append-ldflags -static
		tc-export PKG_CONFIG
		PKG_CONFIG+=" --static"
	fi
	econf \
		--disable-rpath \
		--without-ssl \
		$(use_enable idn iri) \
		$(use_enable ipv6) \
		$(use_enable nls) \
		$(use_enable ntlm) \
		$(use_enable debug)
}

src_install() {
	default

	sed -i \
		-e "s:/usr/local/etc:${EPREFIX}/etc:g" \
		"${ED}"/etc/wgetrc \
		"${ED}"/usr/share/man/man1/wget.1 \
		"${ED}"/usr/share/info/wget.info
}
