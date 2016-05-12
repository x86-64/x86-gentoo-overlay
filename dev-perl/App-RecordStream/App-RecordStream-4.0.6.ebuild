# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/App-CLI/App-CLI-0.313.0.ebuild,v 1.1 2011/09/01 13:31:41 tove Exp $

EAPI=5

MODULE_AUTHOR=TSIBLEY
MODULE_VERSION=4.0.6
inherit perl-module

DESCRIPTION="App::RecordStream"

SLOT="0"
KEYWORDS="amd64 ~ia64 ~ppc ~sparc x86 ~amd64-linux ~x86-linux ~ppc-macos ~x86-macos"
IUSE=""

RDEPEND="
	dev-perl/Text-Autoformat
"
DEPEND="${RDEPEND}"

src_prepare() {
	epatch "${FILESDIR}"/utf8.patch
}
