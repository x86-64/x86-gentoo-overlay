# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/File-Tail/File-Tail-0.99.3.ebuild,v 1.14 2008/11/26 21:06:17 gmsoft Exp $

EAPI=5

inherit perl-module git-2

DESCRIPTION="[% name %] module"
HOMEPAGE="https://github.com/x86-64"
EGIT_REPO_URI="git://software.struct.it/[% name %]/"

SLOT="0"
LICENSE="|| ( GPL-3 )"
KEYWORDS="alpha amd64 hppa ia64 ppc ppc64 sparc x86"
IUSE=""

DEPEND="
	[% deps %]
	dev-lang/perl"

