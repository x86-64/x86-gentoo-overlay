# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v3

EAPI=5
WANT_AUTOCONF=2.5
WANT_AUTOMAKE=1.11

inherit autotools git-r3

DESCRIPTION="An efficient trie implementation."
HOMEPAGE="https://github.com/dcjones/hat-trie"
EGIT_REPO_URI="git://github.com/dcjones/hat-trie.git"

LICENSE="|| ( LGPL-3 )"
SLOT="1"
KEYWORDS="amd64 x86"

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare(){
	cp ${FILESDIR}/common.h ${S}/src/
	eautoreconf
}

src_compile(){
	emake CFLAGS="${CFLAGS} -fPIC" || die
}
