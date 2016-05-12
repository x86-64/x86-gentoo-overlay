# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/File-Tail/File-Tail-0.99.3.ebuild,v 1.14 2008/11/26 21:06:17 gmsoft Exp $

EAPI=5

MODULE_AUTHOR=[% author %]
MODULE_VERSION=[% version %]
DESCRIPTION="[% name %] module"
inherit perl-module

SLOT="0"
KEYWORDS="alpha amd64 hppa ia64 ppc ppc64 sparc x86"
IUSE=""

DEPEND="
	[% deps %]
	dev-lang/perl"
