# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v3

EAPI=5
WANT_AUTOCONF=2.5
WANT_AUTOMAKE=1.11

inherit autotools git-2

DESCRIPTION="Gzip files support in frozen, using seekgzip library"
HOMEPAGE="https://github.com/x86-64/frozen-gzip"
EGIT_REPO_URI="git://github.com/x86-64/frozen-gzip.git"

LICENSE="|| ( GPL-3 )"
SLOT="1"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="
	dev-util/frozen
	dev-libs/seekgzip
"
RDEPEND="${DEPEND}"

src_prepare(){
	eautoreconf
}
