# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v3

EAPI=4
WANT_AUTOCONF=2.5
WANT_AUTOMAKE=1.11

inherit autotools git-2

DESCRIPTION="Mustache in pure C"
HOMEPAGE="https://github.com/x86-64/mustache-c"
EGIT_REPO_URI="git://github.com/x86-64/mustache-c.git"

LICENSE="|| ( LGPL-3 )"
SLOT="1"
KEYWORDS="amd64 x86"

DEPEND=""
RDEPEND="${DEPEND}"

src_compile(){
	eautoreconf
	econf
	emake || die "Error: emake failed!"
}
