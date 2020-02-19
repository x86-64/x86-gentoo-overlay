# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v3

EAPI=5

inherit autotools git-r3

DESCRIPTION="libpostal: international street address NLP"
HOMEPAGE="https://github.com/openvenues/libpostal"
EGIT_REPO_URI="https://github.com/openvenues/libpostal.git"

LICENSE="|| ( MIT )"
SLOT="1"
KEYWORDS="amd64 x86"

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare(){
	eautoreconf
}

src_configure() {
	sed -i "s@libpostal_data download all @libpostal_data download all ${D}@" $S/src/Makefile.am
        econf 
}
