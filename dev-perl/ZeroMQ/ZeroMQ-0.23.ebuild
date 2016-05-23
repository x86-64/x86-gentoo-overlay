# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/App-CLI/App-CLI-0.313.0.ebuild,v 1.1 2011/09/01 13:31:41 tove Exp $

EAPI=5

MODULE_AUTHOR=DMAKI
MODULE_VERSION=0.23
inherit perl-module

DESCRIPTION="A ZeroMQ2 wrapper for Perl"

SLOT="0"
KEYWORDS="amd64 ~ia64 ~ppc ~sparc x86 ~amd64-linux ~x86-linux ~ppc-macos ~x86-macos"
IUSE=""

RDEPEND="
	dev-perl/Task-Weaken
	virtual/perl-XSLoader
"
DEPEND="${RDEPEND}"
