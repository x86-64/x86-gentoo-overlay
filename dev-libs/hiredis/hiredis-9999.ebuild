# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v3

EAPI=5

inherit git-r3

DESCRIPTION="Redis C binding"
HOMEPAGE="https://github.com/antirez/hiredis"
EGIT_REPO_URI="git://github.com/antirez/hiredis.git"

LICENSE="|| ( LGPL-3 )"
SLOT="1"
KEYWORDS="amd64 x86"

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	emake PREFIX="${D}/usr" install || die "Install failed"
}
