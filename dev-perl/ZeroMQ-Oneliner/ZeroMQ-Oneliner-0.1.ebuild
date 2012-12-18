# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/App-CLI/App-CLI-0.313.0.ebuild,v 1.1 2011/09/01 13:31:41 tove Exp $

EAPI=4

EGIT_REPO_URI="git://github.com/x86-64/ZeroMQ-Oneliner.git"
EGIT_BRANCH="master"
#EGIT_SOURCEDIR=${S}
KEYWORDS=""
#S=${WORKDIR}/${P}/Measurement
inherit perl-module git-2

DESCRIPTION="Create ZeroMQ sockets in perl with one line"

SLOT="0"
KEYWORDS="amd64 x86 ~ia64 ~ppc ~sparc ~amd64-linux ~x86-linux ~ppc-macos ~x86-macos"
IUSE=""
LICENSE="|| ( LGPL3 )"

RDEPEND="
	dev-perl/ZeroMQ
	dev-perl/Getopt-Lazy
"
DEPEND="${RDEPEND}"
