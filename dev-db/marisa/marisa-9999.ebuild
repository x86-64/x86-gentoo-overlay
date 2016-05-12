# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v3

EAPI=5
WANT_AUTOCONF=2.5
WANT_AUTOMAKE=1.11

inherit autotools git-2

DESCRIPTION="Memory efficient trie library for dictionary compression using nested patricia LOUDS"
HOMEPAGE="https://github.com/nokuno/marisa-trie"
EGIT_REPO_URI="git://github.com/nokuno/marisa-trie.git"

LICENSE="|| ( LGPL-3 )"
SLOT="1"
KEYWORDS="amd64 x86"

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare(){
	eautoreconf
}
