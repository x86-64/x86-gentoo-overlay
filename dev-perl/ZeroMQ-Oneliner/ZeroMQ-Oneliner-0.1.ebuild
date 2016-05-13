# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

EGIT_REPO_URI="git://github.com/x86-64/ZeroMQ-Oneliner.git"
inherit perl-module git-r3

DESCRIPTION="Create ZMQ sockets using URI as description"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
        >=dev-perl/ZMQ-1.020
        >=dev-perl/ZMQ-LibZMQ4-0.010
"
DEPEND="
        ${RDEPEND}
        virtual/perl-ExtUtils-MakeMaker
        virtual/perl-Test-Simple
"
