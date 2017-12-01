# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/File-Tail/File-Tail-0.99.3.ebuild,v 1.14 2008/11/26 21:06:17 gmsoft Exp $

EAPI=5

MODULE_AUTHOR=NALOBIN
MODULE_VERSION=2.99011
inherit perl-module eutils

DESCRIPTION="Net-Whois-Raw module"

SLOT="0"
KEYWORDS="alpha amd64 hppa ia64 ppc ppc64 sparc x86"
IUSE=""

DEPEND="
	dev-perl/Regexp-IPv6
	dev-lang/perl"

src_prepare(){
	epatch "${FILESDIR}/error_report.patch"
}
