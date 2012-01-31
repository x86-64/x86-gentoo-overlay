# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v3

EAPI=4

inherit git-2 eutils

DESCRIPTION="Leveldb"
HOMEPAGE="http://code.google.com/p/leveldb/"
EGIT_REPO_URI="https://code.google.com/p/leveldb"

LICENSE="|| ( LGPL-3 )"
SLOT="1"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare(){
	epatch "${FILESDIR}"/${P}-pic.patch
}

src_compile(){
	emake || die "Error: emake failed!"
}

src_install(){
	dodir /usr/include/
	cp -R "${S}/include/" "${D}/usr/" || die
	dodir /usr/lib/
	cp "${S}/libleveldb.a" "${D}/usr/lib/" || die
}
