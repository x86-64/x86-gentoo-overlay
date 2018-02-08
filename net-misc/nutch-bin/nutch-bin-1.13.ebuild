# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

SRC_URI="http://www-us.apache.org/dist/nutch/${PV}/apache-nutch-${PV}-bin.tar.gz"
DESCRIPTION="Apache Nutch"

SLOT="1"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
	virtual/jre:1.8
"
DEPEND="
	${RDEPEND}
"

src_unpack() {
	unpack ${A}
	mv apache-nutch-${PV} nutch-bin-${PV}
}

src_compile() {
	true
}

src_install() {
	LIBDIR=/var/lib/nutch
	insinto $LIBDIR
	doins -r *
	fperms +x -R $LIBDIR/bin/
	
	sed "s/50000/500000/g" -i $D/$LIBDIR/bin/crawl

	dodir /usr/bin/
	dosym $LIBDIR/bin/nutch /usr/bin/nutch
	dosym $LIBDIR/bin/crawl /usr/bin/nutch-crawl
}
