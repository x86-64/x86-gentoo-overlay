# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v3

EAPI=5
WANT_AUTOCONF=2.5
WANT_AUTOMAKE=1.11

inherit autotools git-r3

DESCRIPTION="LevelDB support for frozen"
HOMEPAGE="https://github.com/x86-64/frozen-leveldb"
EGIT_REPO_URI="git://github.com/x86-64/frozen-leveldb.git"

LICENSE="|| ( GPL-3 )"
SLOT="1"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="
	dev-util/frozen
	dev-db/leveldb
"
RDEPEND="${DEPEND}"

src_prepare(){
	eautoreconf
}
