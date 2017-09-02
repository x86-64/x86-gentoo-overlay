# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v3

EAPI=5

inherit eutils

MY_PV=${PV:0:4}-${PV:4:2}-${PV:6:2}
DESCRIPTION="Standford NER"
HOMEPAGE="https://nlp.stanford.edu/software/CRF-NER.shtml"
SRC_URI="https://nlp.stanford.edu/software/stanford-ner-$MY_PV.zip"

LICENSE="|| ( LGPL-3 )"
SLOT="1"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="
	virtual/jre
"
RDEPEND="${DEPEND}"

src_unpack(){
	default
	mv *$MY_PV* "$S"
}

src_compile(){
	true
}

src_install(){
	dodir /usr/share/${PN}/
	cp -R ${S}/* "${D}/usr/share/${PN}" || die
}
