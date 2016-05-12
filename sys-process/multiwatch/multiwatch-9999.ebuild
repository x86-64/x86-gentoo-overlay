# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v3

EAPI=5

inherit autotools git-2

DESCRIPTION="Multiwatch forks multiple instance of one application and keeps them running"
HOMEPAGE="https://github.com/lighttpd/multiwatch"
EGIT_REPO_URI="https://github.com/lighttpd/multiwatch.git"

LICENSE="MIT"
SLOT="1"
KEYWORDS="amd64 x86"

DEPEND="
	dev-libs/libev
	>=dev-libs/glib-2.16.0
"
RDEPEND="${DEPEND}"

src_prepare() {
        eautoreconf
}

src_install() {
        emake DESTDIR="${D}" install
        doman multiwatch.1
}

