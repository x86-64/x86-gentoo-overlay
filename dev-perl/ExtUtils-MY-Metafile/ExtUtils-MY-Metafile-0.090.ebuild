# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DIST_AUTHOR="HIO"
DIST_VERSION="0.09" 
DIST_NAME="ExtUtils-MY_Metafile"
inherit perl-module

DESCRIPTION="No description available"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
	dev-perl/Test-Exception
	virtual/perl-ExtUtils-MakeMaker
	virtual/perl-Test-Simple
"
DEPEND="
	${RDEPEND}
"

src_install() {
	perl-module_src_install
	b=`find ${D} -name 'MY_Metafile.pm'`
	a=`dirname $b`
	mkdir $a/../inc/
	cp -r $a $a/../inc/
}
