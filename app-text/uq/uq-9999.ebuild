# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v3

EAPI=5
inherit git-2 eutils

DESCRIPTION="B-Tree based uniq utility (from avz/uq)"
HOMEPAGE="https://github.com/x86-64/uq"
EGIT_REPO_URI="git://github.com/x86-64/uq.git"

LICENSE="MIT"
SLOT="1"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="
"
RDEPEND="${DEPEND}"

src_compile(){
	emake -j1 PREFIX=${D} CFLAGS="-c -O2 -Wall -Werror -I/usr/local/include -g $CFLAGS" || die
}

src_install(){
	dodir /bin
	emake -j1 PREFIX=${D} install || die
}
