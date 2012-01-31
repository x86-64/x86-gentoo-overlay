# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v3

EAPI=4
WANT_AUTOCONF=2.5
WANT_AUTOMAKE=1.11

inherit autotools git-2

DESCRIPTION="Flow-based data processing daemon"
HOMEPAGE="http://x86-64.github.com/frozen/"
EGIT_REPO_URI="git://github.com/x86-64/frozen.git"

LICENSE="|| ( GPL-3 )"
SLOT="1"
KEYWORDS="amd64 x86"
IUSE="debug fuse zeromq"

DEPEND="
	fuse? ( sys-fs/fuse )
	zeromq? ( net-libs/zeromq )
"
RDEPEND="${DEPEND}"

src_compile(){
	eautoreconf
	econf $(use_enable debug)
	emake || die "Error: emake failed!"
}
