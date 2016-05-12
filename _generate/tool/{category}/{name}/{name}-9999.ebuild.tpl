# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v3

EAPI=5

inherit git-2

DESCRIPTION="[% desc %]"
HOMEPAGE="https://github.com/x86-64"
EGIT_REPO_URI="git://software.struct.it/[% name %]/"

LICENSE="|| ( GPL-3 )"
SLOT="1"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="
	[% deps %]
"
RDEPEND="${DEPEND}"

src_install(){
	emake DESTDIR="${D}" install || die "make install failed"
}

