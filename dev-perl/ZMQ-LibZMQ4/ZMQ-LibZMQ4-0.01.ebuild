# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

MODULE_AUTHOR=MOSCONI
MODULE_VERSION=0.01
inherit perl-module

DESCRIPTION="A libzmq 4.x wrapper for Perl"

SLOT="0"
KEYWORDS="~amd64 ~hppa ~ppc ~ppc64 ~x86"
IUSE="test"

RDEPEND="
	=net-libs/zeromq-4*
	dev-perl/ZMQ-Constants
	virtual/perl-XSLoader
"
DEPEND="${RDEPEND}
	 dev-perl/Task-Weaken
	virtual/perl-ExtUtils-MakeMaker
	virtual/pkgconfig
	test? (
		dev-perl/Test-Requires
		dev-perl/Test-Fatal
		dev-perl/Test-TCP
		virtual/perl-Test-Simple
	)
"

SRC_TEST=do

src_prepare() {
	sed "/BEGIN/a use lib '.';" -i ${S}/Makefile.PL
}
